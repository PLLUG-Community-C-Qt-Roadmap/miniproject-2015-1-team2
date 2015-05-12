import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0


Window {

    id:exit
    color: "black"
    width: 200
    height: 100
    flags: Qt.FramelessWindowHint

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
        id:yes
        x: parent.width/3 - 25
        y: parent.height - 25



    ItemForButton{

        text: "yes"
        onClicked:{
             itemLoader.source = ""
             mainMenuLoader.source = ""
            }
           }
        }

    Item{
        id:no
        x: parent.width/1.5 - 15
        y: parent.height - 25


   ItemForButton{

        text: "No"
        onClicked: {
            mainMenuLoader.item.mmItem.enabled = true
            mainMenuLoader.source = "MainMenu.qml"
            itemLoader.source = ""

           }
       }

 }
}


