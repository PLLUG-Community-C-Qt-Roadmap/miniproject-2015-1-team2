#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "settings.h"
#include "field.h"
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Settings>("PacmanSettings", 1, 0, "Settings");
    qmlRegisterType<Field>("PacmanMap", 1, 0, "TileField");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
