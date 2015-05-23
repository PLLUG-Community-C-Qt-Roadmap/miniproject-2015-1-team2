#include "startup.h"
#include "field.h"

#include <QQmlContext>
#include <QQmlApplicationEngine>

Startup::Startup(QObject* parent):
    QObject(parent),
    mEngine(new QQmlApplicationEngine(this)),
    mField(new Field(this))
{
    mEngine->rootContext()->setContextProperty("TileField", mField);
    mEngine->load(QUrl(QStringLiteral("qrc:/main.qml")));
}
