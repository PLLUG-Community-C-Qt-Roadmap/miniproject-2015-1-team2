import QtQuick 2.4
import QtQuick.Window 2.2

Window {

    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }
    id: mainWindow
    visible: true
    color: "black"
    width: 360
    height: 360

    // Loads menu item, when ones is clicked
    Loader {
        id : itemLoader
    }


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
                    itemLoader.item.show()
                    mainWindow.close()
                }
            }

            ItemForButton {

                text: "High Scores"

                onClicked: {

                    itemLoader.source = "HighScores.qml"
                    itemLoader.item.show()
                    mainWindow.close()
                }
            }

            ItemForButton {

                text: "History"

                onClicked: {

                    itemLoader.source = "History.qml"
                    itemLoader.item.show()
                    mainWindow.close()
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

