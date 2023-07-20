#include <fstream>
#include <QDebug>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonDocument>
#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "quickflux/quickflux.h"
#include "configuration_wizard.h"
#include "xml_parser.h"
#include "xml_wraper.h"

int showConfigurationWizard()
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    
    int argc = 0;
    QGuiApplication app(argc, nullptr);
    
    registerQuickFluxQmlTypes();
    
    XmlParser parser;
    bool ret = parser.xml2Json(QGuiApplication::applicationDirPath() + "/model.xml");
    if (!ret) {
        qDebug() << "xml parser failed";
        return -1;
    }
    // qDebug() << parser.getJson();
    
    // std::ofstream ofs("./data.json", std::ios::binary);
    // ofs << parser.getDefaultValues().toStdString();
    // ofs.close();
    
    XmlWraper xml_wraper;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("_test_ui_data", parser.getJson());
    engine.rootContext()->setContextProperty("_data", parser.getDefaultValues());
    engine.rootContext()->setContextProperty("_xml_wraper", &xml_wraper);
    const QUrl url("qrc:/qml/main.qml");
    engine.load(url);

    return app.exec();
}