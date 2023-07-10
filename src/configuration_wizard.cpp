#include <QDebug>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "configuration_wizard.h"

int showConfigurationWizard()
{
    int argc = 0;
    QGuiApplication app(argc, nullptr);

    QQmlApplicationEngine engine;
    const QUrl url("qrc:/qml/main.qml");
    engine.load(url);

    return app.exec();
}