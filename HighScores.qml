import QtQuick 2.4
import QtQuick.Window 2.2

Rectangle {
    height: 360
    width: 360
    color: "black"
    id: highscores


        Text {
            text: "High scores"
            anchors.horizontalCenter: parent.horizontalCenter
            y: 5
            font.family: pacmanFont.name
            font.pointSize: 30
            color: "red"
         }
        Text {
             anchors.horizontalCenter: parent.horizontalCenter
             text: "Top players"
             y: 75
             color: "yellow"
             font.family: pacmanFont.name
             font.pointSize: 16
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

Rectangle{

    Rectangle{
        height: 70
        Image{
      source: "qrc:images/Images/pashalka.png"
        }
    }

    anchors.centerIn: parent
    color: "red"
    height: 130
    width: 300
    ListView {

        id:myListView
        model: highscoresModel
        delegate: highscoresDelegate
        width: parent.width
        height: parent.height
    }
}
    Component {
            id: highscoresDelegate
            Rectangle{
                color:"black"
                height: text.height + 10
                width: myListView.width
                Row{

                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 40

                        Text {
                            id:text
                            text: name;
                            font.pointSize: 12
                            font.family: pacmanFont.name
                            color: "yellow"
                        }
                        Text {
                            text: score;
                            font.pixelSize: 20
                            color: "red"
                        }
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


