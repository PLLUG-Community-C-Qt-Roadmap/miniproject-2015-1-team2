import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0


Rectangle {

    id:exit
    color: "black"
    width: 200
    height: 100

    anchors.centerIn: parent

    border {
        color: "white"
        width: 1
    }

    Text {
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
                 mainWindow.close()
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
                loader.item.enabled = true
                loader.source = "MainMenu.qml"
                loaderForExitWindow.source = ""
            }
        }

    }
}


