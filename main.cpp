#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "settings.h"
#include <QQuickView>
#include "maphandler.h"

int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);

    qmlRegisterType<Settings>("PacmanSettings", 1, 0, "Settings");

    MapHandler mh;
    mh.readInTmxFile("C:/QtProjects/MapTest1/example.tmx");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
