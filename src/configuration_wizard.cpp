﻿#include <fstream>
#include <QDebug>
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
// 向导结果数据
const std::string out_path = "./wizard_result_data.xml";
int showConfigurationWizard(const std::string& modle_path)
{
    //qputenv("QSG_RENDER_LOOP","basic");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    
    int argc = 0;
    QGuiApplication app(argc, nullptr);
    
    registerQuickFluxQmlTypes();
    qmlRegisterType<QtFloatValidator>("com.kc.quick", 1, 0, "KCFloatValidator");
    
    XmlParser parser;
    //bool ret = parser.xml2Json(QGuiApplication::applicationDirPath() + "/model.xml");
	bool ret = parser.xml2Json(modle_path);
    if (!ret) {
        qDebug() << "xml parser failed";
        return -1;
    }

    app_dir = QGuiApplication::applicationDirPath().toLocal8Bit().toStdString();
    XmlWraper xml_wraper(app_dir + "/" + out_path);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("_test_ui_data", parser.getJson());
    engine.rootContext()->setContextProperty("_special_node", parser.getSpecialVariants());
    engine.rootContext()->setContextProperty("_data", parser.getDefaultValues());
    engine.rootContext()->setContextProperty("_chassis_default_value", parser.getChassisDefaultValues());
    engine.rootContext()->setContextProperty("_xml_wraper", &xml_wraper);
    const QUrl url("qrc:/qml/main.qml");
    engine.load(url);

    QObject *topLevel = engine.rootObjects().value(0);
    QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);
    Qt::WindowFlags flags = window->flags();
    window->setFlags(flags | Qt::WindowStaysOnTopHint);
    window->setModality(Qt::ApplicationModal);

    return app.exec();
}

std::string getWizardInfoFilePath()
{
    return app_dir + "/" + out_path;
}
