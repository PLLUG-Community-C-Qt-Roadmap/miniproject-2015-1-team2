import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    height: 360
    width: 360
    color: "black"
    id: highscores

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
        Text {
            anchors.horizontalCenter: parent
            text: "Top players"
            x: 75
            y: 75
             color: "yellow"
             font.family: pacmanFont.name
             font.pointSize: 16
           }
        Column {
            anchors.centerIn: parent
            spacing: 20

            Grid
            {
                id: highScoreGrid
                rows: 10
                columns: 2
                anchors.centerIn: parent
                columnSpacing: 75
                rowSpacing: 5


                Text
                {
                    text: "Player1"
                    color: "red"
                    font.bold: true
                    font.pointSize: 12

                }

                Text
                {

                    text: "150"
                    color: "red"
                    font.bold: true
                    font.pointSize: 12
                }

                Text
                {
                    text: "Player2"
                    color: "yellow"
                    font.bold: true
                    font.pointSize: 12
                }

                Text
                {
                    text: "150"
                    color: "yellow"
                    font.bold: true
                    font.pointSize: 12
                }
                Text
                {
                    text: "Player3"
                    color: "yellow"
                    font.bold: true
                    font.pointSize: 12
                }

                Text
                {
                    text: "150"
                    color: "yellow"
                    font.bold: true
                    font.pointSize: 12
                }
            }
        }

        Item {
            ItemForButton {
                text: "Back"
                onClicked: {
                    mainWindow.show()
                    itemLoader.source = ""
                }
            }
            x: parent.width/2-30
            y: parent.height/2 + 100
        }
    }
}
