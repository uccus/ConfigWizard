#include <QDebug>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "configuration_wizard.h"

int showConfigurationWizard()
{
    qputenv("QSG_RENDER_LOOP","basic");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    int argc = 0;
    QGuiApplication app(argc, nullptr);

    QQmlApplicationEngine engine;
    const QUrl url("qrc:/qml/main.qml");
    engine.load(url);

    return app.exec();
}