#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "settings.h"
#include "startup.h"
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Settings>("PacmanSettings", 1, 0, "Settings");
    Startup startup;
    return app.exec();
}
