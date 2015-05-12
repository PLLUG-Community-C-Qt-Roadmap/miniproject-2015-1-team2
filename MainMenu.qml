import QtQuick 2.4
import QtQuick.Window 2.2

Rectangle {
    id: mainMenu
    visible: true
    color: "black"
    width: 360
    height: 360

    property alias mmItem: mmItem

    Item {
        id: mmItem
        anchors.fill: parent

        LogoItem {

            x : parent.width / 2
            y : 25
        }
        Column {

            anchors.centerIn: parent
            spacing: 10

            ItemForButton {

                text: "New Game"

                onClicked: {

                    loader.source = "NewGame.qml"
                }
            }

            ItemForButton {

                text: "Options"

                onClicked: {

                    loader.source = "Options.qml"
                }
            }

            ItemForButton {

                text: "High Scores"

                onClicked: {

                    loader.source = "HighScores.qml"
                }
            }

            ItemForButton {

                text: "History"

                onClicked: {

                    loader.source = "History.qml"
                }
            }



             ItemForButton {
                 text: "Exit"

                 onClicked: {
                     loader.item.enabled = false
                     loaderForExitWindow.source = "Exit.qml"
                 }

             }
        }

    }
}

