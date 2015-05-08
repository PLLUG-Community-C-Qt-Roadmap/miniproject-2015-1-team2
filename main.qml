import QtQuick 2.4
import QtQuick.Window 2.2

Window {

    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }

    visible: true
    color: "black"
    id : mainWindow
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
                    options.show();
                }
            }

            ItemForButton {
                text: "High Scores"
                onClicked: {
                    highscores.show();
                }
            }

            ItemForButton {
                text: "History"
                onClicked: {
                    history.show();
                }
            }

            ItemForButton {
                text: "Quit"
                onClicked: {
                    // TODO
                }
            }

            HighScores{
                id: highscores
            }

            Options{
                id : options
            }

            History {
                id: history
            }
        }

    }

}
