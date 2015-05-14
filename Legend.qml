import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0



Rectangle{

    id: history
    color: "black"
    width: 360
    height: 360



        Text
        {
            text: "Legend"
            color: "red"
            font.family: pacmanFont.name
            font.pointSize: 20
            x: parent.width/2 - width/2
            y: 20

        }


    Column
    {
        anchors.centerIn: parent


            spacing: 5

            Row
            {

                Image {

                    id: blinky

                    width : 30
                    height: 30

                    source: "qrc:/images/Images/redGhost.png"
                }

                Text
                {

                    text: " - Blinky"
                    font.family: pacmanFont.name
                    color: "yellow"
                    font.bold: true
                    font.pointSize: 12
                }

            }

            Row{
                Image {

                    id: clyde

                    width : 30
                    height: 30

                    source: "qrc:/images/Images/yellowGhost.png"
                }

                Text
                {

                    text: " - Clyde"
                    font.family: pacmanFont.name
                    color: "yellow"
                    font.bold: true
                    font.pointSize: 12
                }
            }


            Row{
                Image {

                    id: pinky

                    width : 30
                    height: 30

                    source: "qrc:/images/Images/pinkGhost.png"
                }

                Text
                {

                    text: " - Pinky"
                    font.family: pacmanFont.name
                    color: "yellow"
                    font.bold: true
                    font.pointSize: 12
                }
            }

            Row{
                Image {

                    id: inky

                    width : 30
                    height: 30

                    source: "qrc:/images/Images/blueGhost.png"
                }

                Text
                {

                    text: " - Inky"
                    font.family: pacmanFont.name
                    color: "yellow"
                    font.bold: true
                    font.pointSize: 12
                }
            }

        }





    Item{
        id: back
        x: parent.width/2 - 35
        y: parent.height - 75
            ItemForButton
            {
                text: "Back"
                onClicked: {

                    loader.source = "MainMenu.qml"
                }
            }
        }











}


