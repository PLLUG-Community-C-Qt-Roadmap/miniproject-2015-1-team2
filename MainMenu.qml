import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    id: mainWindow
    visible: true
    color: "black"
    width: 360
    height: 360

    Item {

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
                    // TODO
                }
            }

            ItemForButton {

                text: "Options"

                onClicked: {

                    itemLoader.source = "Options.qml"
                    mainMenuLoader.source = ""
                }
            }

            ItemForButton {

                text: "High Scores"

                onClicked: {

                    itemLoader.source = "HighScores.qml"
                    mainMenuLoader.source = ""
                }
            }

            ItemForButton {

                text: "History"

                onClicked: {

                    itemLoader.source = "History.qml"
                    itemLoader.item.show()
                    mainMenuLoader.source = ""
                }
            }

            ItemForButton {

                text: "Quit"

                onClicked: {
                     // TODO
                }

            }

        }

    }
}

