#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "backend.h"
#include <wiringPi.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<BackEnd>("BackEnd", 1, 0, "BackEnd");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    wiringPiSetup();
    pinMode(0, OUTPUT);

    return app.exec();
}
