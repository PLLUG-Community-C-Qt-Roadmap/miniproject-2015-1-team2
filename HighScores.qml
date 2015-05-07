import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    height: 360
    width: 360
    id: highscores
    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }

    Item {
        anchors.fill: parent
        Column {
            Text {
                text: "High scores"
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: pacmanFont.name
                font.pointSize: 20
            }
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "      Top 5"
                font.family: pacmanFont.name
                font.pointSize: 16
            }

            Column {
                spacing: 10

                Text {
                    text: "1.Player1---------100<br>
                           2.Player2----------90<br>
                           3.Player3----------80<br>
                           4.Player4----------70<br>
                           5.Player5----------60"
                    font.family: pacmanFont.name
                    font.pointSize: 12
                }
            }
        }
    }
}
