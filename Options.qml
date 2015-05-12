import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Rectangle {

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

    Column {

        anchors{

            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        spacing: 20

        OptionsLevelItem {

                x : someText.x
                y : someText.y - 40

        }

        Row {
            spacing: 20

            Text {
                id: someText
                color: "yellow"
                font.family: pacmanFont.name
                font.pointSize: 15
                text: "Sound"
            }

            CheckBox {
                checked: true
            }
        }

        Row {
            spacing: 20

            Text {
                color: "yellow"
                font.family: pacmanFont.name
                font.pointSize: 15
                text: "Volume"
            }

            Slider {
                value: 0.5
            }

        }

        Row {
            spacing: 20

            Text {


                color: "yellow"
                font.family: pacmanFont.name
                font.pointSize: 15
                text: "FullScreen"
            }

            CheckBox {
                    checked: true
            }
        }

    }

    Item {
            ItemForButton {
                text: "Back"
                onClicked: {
                    loader.source = "MainMenu.qml"
                }
            }
            x: parent.width/2-30
            y: parent.height/2 + 100
        }
}
