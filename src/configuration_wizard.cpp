#include <QDebug>
#include <QJsonObject>
#include <QJsonDocument>
#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "quickflux/quickflux.h"

#include "configuration_wizard.h"

// 读取配置文件并转换为json格式提供给qml
QString xml2JSON()
{
    return "";
}

int showConfigurationWizard()
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    

    // QJsonObject object;
    // object["name"] = "chassis";
    // QJsonDocument doc;
    // doc.setObject(object);
    // QString strJson = doc.toJson(QJsonDocument::Compact);

    // qDebug() << strJson;

    int argc = 0;
    QGuiApplication app(argc, nullptr);
    
    registerQuickFluxQmlTypes();
    // fake_data

    QQmlApplicationEngine engine;
    // engine.rootContext()->setContextProperty("_test_ui_data", strJson);
    const QUrl url("qrc:/qml/main.qml");
    engine.load(url);

    return app.exec();
}