TEMPLATE = app

QT += qml quick

unix {
    QMAKE_CXXFLAGS += -std=c++14
}
win32 {
    CONFIG += c++14
}

SOURCES += main.cpp \
    settings.cpp \
    tile.cpp \
    field.cpp \
    startup.cpp

RC_ICONS = Pacman.ico

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    settings.h \
    tile.h \
    field.h \
    startup.h
