import QtQuick 2.4
import QtQuick.Window 2.2

Rectangle {
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
            //anchors.horizontalCenter: parent
            text: "Top players"
            x: 75
            y: 75
             color: "yellow"
             font.family: pacmanFont.name
             font.pointSize: 16
           }
    }

    ListModel
    {
        id: highscoresModel
        ListElement { name: "Player" ; score: "100" }
        ListElement { name: "Player" ; score: "200" }
        ListElement { name: "Player" ; score: "300" }
        ListElement { name: "Player" ; score: "400" }
        ListElement { name: "Player" ; score: "500" }
    }


    ListView {
        anchors.fill: parent
        model: highscoresModel
        delegate: highscoresDelegate
    }

    Component {
            id: highscoresDelegate

                Row{
                        spacing: 40

                        Text {
                            text: name;
                            font.pixelSize: 20
                            font.family: pacmanFont.name
                            color: "yellow"
                        }
                        Text {
                            text: score;
                            font.pixelSize: 20
                            color: "white"
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


