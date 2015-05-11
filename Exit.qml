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
        id: no
        x: parent.width/1.5-35
        y: parent.height - 50

    ItemForButton{

         text: "No"
         onClicked: {
         mainMenuLoader.source = "MainMenu.qml"
         itemLoader.source = ""

            }
        }
    Item{
        id:yes
        x: parent.width/3-35
        y: parent.height - 20
            ItemForButton{

                text: "yes"
                onClicked: {

                    mainMenuLoader.source = "MainMenu.qml"
                    itemLoader.source = ""
                    mainMenuLoader.source = ""
                }
            }
        }

}

}
