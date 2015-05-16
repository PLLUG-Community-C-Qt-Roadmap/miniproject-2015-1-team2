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

    Row{
        anchors.centerIn: parent
    Column
    {




            spacing: 5
            Text
            {

                text: "      Character / Nickname \n \n"
                font.family: pacmanFont.name
                color: "white"
                font.bold: true
                font.pointSize: 10
            }


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

                    text: "  - shadow           'Blinky' "
                    font.family: pacmanFont.name
                    color: "red"
                    font.bold: true
                    font.pointSize: 10
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

                    text: "  - pockey           'Clyde' "
                    font.family: pacmanFont.name
                    color: "yellow"
                    font.bold: true
                    font.pointSize: 10
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

                    text: "  - speedy            'Pinky' "
                    font.family: pacmanFont.name
                    color: "pink"
                    font.bold: true
                    font.pointSize: 10
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

                    text: "  - bashful            'Inky' "
                    font.family: pacmanFont.name
                    color: "#00FFFF"
                    font.bold: true
                    font.pointSize: 10
                }
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


