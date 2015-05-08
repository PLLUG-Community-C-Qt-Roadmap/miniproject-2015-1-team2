import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }
    id: options
    width: 360
    height: 360
    color: "black"
    Text {
        color: "red"
        font.family: pacmanFont.name
        font.pointSize: 20
        x: parent.width/2-50
        y: 20
        text: "Options"
    }
    Text {
        color: "yellow"
        font.family: pacmanFont.name
        font.pointSize: 15
        x: parent.width/2-80
        y: parent.height/2-100
        text: "Sound"
    }
    CheckBox {
        checked: true
        x: parent.width/2+123
        y: parent.height/2-95
    }
    Text {
        color: "yellow"
        font.family: pacmanFont.name
        font.pointSize: 15
        x: parent.width/2-80
        y: parent.height/2-60
        text: "Volume"
    }
    Slider {
        value: 0.5
        x: parent.width/2+100
        y: parent.height/2-55
    }
    Text {
        color: "yellow"
        font.family: pacmanFont.name
        font.pointSize: 15
        x: parent.width/2-80
        y: parent.height/2-20
        text: "FullScreen"
    }
    CheckBox {
            checked: true
            x: parent.width/2+123
            y: parent.height/2-15
    }

    Text {
        color: "yellow"
        font.family: pacmanFont.name
        font.pointSize: 15
        x: parent.width/2-80
        y: parent.height/2+20
        text: "Difficulty"
    }
    Item {
            ItemForButton {
                text: "Back"
                onClicked: {
                    options.close()
                }
            }
            x: parent.width/2
            y: parent.height/2+100
        }
}
