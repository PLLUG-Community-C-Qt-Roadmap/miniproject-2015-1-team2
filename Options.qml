import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {

    id: options
    width: 360
    height: 360
    color: "black"
    Text {
        color: "red"
        font.family: pacmanFont.name
        font.pointSize: 20
        x: parent.width/2-80
        y: 20
        text: "Options"
        }
    Grid {
        rows: 4
        columns: 2
        anchors.centerIn: parent
        spacing: 20
        Text {
            color: "yellow"
            font.family: pacmanFont.name
            font.pointSize: 15
            text: "Sound"
        }
        CheckBox {
            checked: true
        }
        Text {
            color: "yellow"
            font.family: pacmanFont.name
            font.pointSize: 15
            text: "Volume"
        }
        Slider {
            value: 0.5
        }
        Text {
            color: "yellow"
            font.family: pacmanFont.name
            font.pointSize: 15
            text: "FullScreen"
        }
        CheckBox {
                checked: true
        }

        Text {
            color: "yellow"
            font.family: pacmanFont.name
            font.pointSize: 15
            text: "Difficulty"
        }
    }
    Item {
            ItemForButton {
                text: "Back"
                onClicked: {
                    options.close()
                    mainWindow.show()
                }
            }
            x: parent.width/2-30
            y: parent.height/2 + 100
        }
}
