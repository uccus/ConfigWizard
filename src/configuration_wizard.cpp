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
#include "QtFloatValidator.h"

int showConfigurationWizard()
{
    qputenv("QSG_RENDER_LOOP","basic");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    
    int argc = 0;
    QGuiApplication app(argc, nullptr);
    
    registerQuickFluxQmlTypes();
    qmlRegisterType<QtFloatValidator>("com.kc.quick", 1, 0, "KCFloatValidator");
    
    XmlParser parser;
    bool ret = parser.xml2Json(QGuiApplication::applicationDirPath() + "/model.xml");
    if (!ret) {
        qDebug() << "xml parser failed";
        return -1;
    }

    XmlWraper xml_wraper;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("_test_ui_data", parser.getJson());
    engine.rootContext()->setContextProperty("_special_node", parser.getSpecialVariants());
    engine.rootContext()->setContextProperty("_data", parser.getDefaultValues());
    engine.rootContext()->setContextProperty("_chassis_default_value", parser.getChassisDefaultValues());
    engine.rootContext()->setContextProperty("_xml_wraper", &xml_wraper);
    const QUrl url("qrc:/qml/main.qml");
    engine.load(url);

    return app.exec();
}