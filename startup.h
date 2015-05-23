#ifndef STARTUP_H
#define STARTUP_H

#include <QObject>

class QQmlApplicationEngine;
class Field;

class Startup: public QObject
{
    Q_OBJECT
public:
    explicit Startup(QObject* parent =0);

private:
    QQmlApplicationEngine* mEngine;
    Field* mField;
};

#endif // STARTUP_H
