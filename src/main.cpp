#include <fstream>
#include <QDebug>
#include <QSharedMemory>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonDocument>
#include <QQmlContext>
#include <QQuickWindow>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "quickflux/quickflux.h"
#include "configuration_wizard.h"
#include "xml_parser.h"
#include "xml_wraper.h"
#include "QtFloatValidator.h"

// 应用程序目录
std::string app_dir;
// ui配置文件
std::string ui_config_file;
// 向导结果数据
const std::string out_path = "./wizard_result_data.xml";
// 外部输入的结果数据文件
std::string result_data_path;

void parseCmd(int argc, char* argv[])
{
    // 默认配置文件
    ui_config_file = "./model.xml";
    if (argc > 1) {
        // 第一个参数是配置文件
        ui_config_file = std::string(argv[1]);
    }
    if (argc > 2) {
        // 第二个参数是结果数据文件
        result_data_path = std::string(argv[2]);
    }
}

int main(int argc, char* argv[])
{
    //qputenv("QSG_RENDER_LOOP","basic");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    
    QGuiApplication app(argc, argv);
    
    parseCmd(argc, argv);
    
    registerQuickFluxQmlTypes();
    qmlRegisterType<QtFloatValidator>("com.kc.quick", 1, 0, "KCFloatValidator");
    
    XmlParser parser;
    //bool ret = parser.xml2Json(QGuiApplication::applicationDirPath() + "/model.xml");
	bool ret = parser.xml2Json(ui_config_file);
    if (!ret) {
        qDebug() << "xml parser failed";
        return -1;
    }
    // 解析数据映射文件
    ret = parser.parseFieldMapXml();
    if (!ret) {
        qDebug() << "parseFieldMap failed";
    }
    
    if (!result_data_path.empty()) {
        // 存在外部输入的数据文件
        parser.parseDataXml(result_data_path);
    }

    app_dir = QGuiApplication::applicationDirPath().toLocal8Bit().toStdString();
    XmlWraper xml_wraper(app_dir + "/" + out_path);
    xml_wraper.setFieldMap(parser.getFieldMap());

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("_test_ui_data", parser.getJson());
    engine.rootContext()->setContextProperty("_special_node", parser.getSpecialVariants());
    engine.rootContext()->setContextProperty("_data", parser.getDefaultValues());
    engine.rootContext()->setContextProperty("_chassis_default_value", parser.getChassisDefaultValues());
    engine.rootContext()->setContextProperty("_xml_wraper", &xml_wraper);
    const QUrl url("qrc:/qml/main.qml");
    engine.load(url);

    // 通过.tmp.txt文件传输内容
    std::ofstream ofs("./.tmp", std::ios::trunc);
    int res = app.exec();
    if (res == 0) {
        ofs << app_dir << "/" << out_path;
    }
    ofs.close();
    return res;
}