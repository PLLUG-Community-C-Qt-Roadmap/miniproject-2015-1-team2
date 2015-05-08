import QtQuick 2.4
import QtQuick.Window 2.2

Window {

    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }

    visible: true
    color: "black"

    width: 360
    height: 360

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
