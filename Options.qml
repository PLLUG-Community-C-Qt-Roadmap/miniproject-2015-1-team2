import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }
    id: options
    //visible: true
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
        y: 80
        text: "Sound"
    }
    CheckBox {
        checked: true
        x: parent.width/2+123
        y: 85
    }
    Text {
        color: "yellow"
        font.family: pacmanFont.name
        font.pointSize: 15
        x: parent.width/2-80
        y: 120
        text: "Volume"
    }
    Slider {
        value: 0.5
        x: parent.width/2+100
        y: 125
    }
    Text {
        color: "yellow"
        font.family: pacmanFont.name
        font.pointSize: 15
        x: parent.width/2-80
        y: 160
        text: "FullScreen"
    }
    CheckBox {
            checked: true
            x: parent.width/2+123
            y: 165
    }

    Text {
        color: "yellow"
        font.family: pacmanFont.name
        font.pointSize: 15
        x: parent.width/2-80
        y: 200
        text: "Difficulty"
    }
    Item {
        ItemForButton {
            text: "Back"
            x: options.width/2+10
            y: 300
            onClicked: {
                options.close()
            }
        }
    }
}
