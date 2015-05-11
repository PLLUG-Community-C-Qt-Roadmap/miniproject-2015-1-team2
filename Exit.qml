import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0


Window {

    id:exit
    color: "black"
    width: 200
    height: 100

    Text
    {
        text: "Are you sure?"
        color: "red"
        font.family:  pacmanFont.name
        font.pointSize: 8
        x: parent.width/2 - width/2
        y: 15

    }
    Item{
        id: next
        x: parent.width/1.5 - 10
        y: parent.height - 50

    ItemForButton{
         id:back
         text: "No"
         onClicked: {
         mainMenuLoader.source = "MainMenu.qml"
         itemLoader.source = ""

            }
        }

}

}
