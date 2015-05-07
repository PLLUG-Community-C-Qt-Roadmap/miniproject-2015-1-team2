import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    height: 360
    width: 360
    color: "black"
    id: highscores
    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }

    Item {
        anchors.fill: parent
        Text {
            text: "High scores"
            //anchors.horizontalCenter: parent.horizontalCenter
            x: 5
            y: 5
            font.family: pacmanFont.name
            font.pointSize: 30
            color: "red"
         }

        Column {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "   Top players"
                 color: "yellow"
                 font.family: pacmanFont.name
                 font.pointSize: 16
            }

            Text {
                text: "1.Player1---------100<br>
                       2.Player2----------90<br>
                       3.Player3----------80<br>
                       4.Player4----------70<br>
                       5.Player5----------60"
                 color: "yellow"
                 anchors.horizontalCenter: parent.horizontalCenter
                 font.family: "Arial"
                 font.pointSize: 12
             }
        }

        Item {
            ItemForButton {
                text: "Back"
                onClicked: {
                    highscores.close();
                }
            }
            x: 200
            y: 300
        }
    }
}
