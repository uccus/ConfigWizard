#include <QDebug>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "quickflux/quickflux.h"

#include "configuration_wizard.h"

int showConfigurationWizard()
{
    qputenv("QSG_RENDER_LOOP","basic");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    int argc = 0;
    QGuiApplication app(argc, nullptr);
    
    registerQuickFluxQmlTypes();
    // fake_data

    QQmlApplicationEngine engine;
    const QUrl url("qrc:/qml/main.qml");
    engine.load(url);

    return app.exec();
}