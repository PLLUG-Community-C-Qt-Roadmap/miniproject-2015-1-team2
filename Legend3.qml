import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0



Rectangle{

    id: legend3
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

        Text
               {
                   text: "Fruits"
                   color: "white"
                   font.family: pacmanFont.name
                   font.pointSize: 12
                   x: parent.width/2 - width/2
                   y: 67

               }

    Row
    {

            anchors.centerIn:  parent
            spacing: 43

            Column
            {
                id: fruitColumn

                    Row
                    {

                        Image
                        {
                            id: cherry
                            y: -7.5
                            width : 30
                            height: 30
                            source: "qrc:/images/Images/Cherry.png"
                        }
                        Text
                        {
                            text: " 200 points"
                            color: "white"
                            font.bold: true
                            font.pointSize: 10
                        }


                    }

                    Row
                    {
                        Image
                        {
                            id: strawberry
                            y: -7.5
                            width : 30
                            height: 30
                            source: "qrc:/images/Images/Strawberry.png"
                        }
                        Text
                        {

                            text: " 300 points"
                            color: "white"
                            font.bold: true
                            font.pointSize: 10
                        }
                    }

                    Row
                    {
                        Image {

                            id: orange
                            y: -7.5
                            width : 30
                            height: 30
                            source: "qrc:/images/Images/Orange.png"
                        }
                        Text
                        {

                            text: " 500 points"
                            color: "white"
                            font.bold: true
                            font.pointSize: 10
                        }
                    }

                    Row
                    {
                        Image
                        {
                            id: apple
                            y: -7.5
                            width : 30
                            height: 30
                            source: "qrc:/images/Images/Apple.png"
                        }
                        Text
                        {

                            text: " 700 points"
                            color: "white"
                            font.bold: true
                            font.pointSize: 10
                        }
                    }
            }

            Column
            {
                id: scoresForFruits
                Row
                {
                    Image
                    {
                        id: galaxianBoss
                        y: -7.5
                        width : 30
                        height: 30
                        source: "qrc:/images/Images/Galaxian-boss.png"
                    }
                    Text
                    {

                        text: " 1000 points"
                        color: "white"
                        font.bold: true
                        font.pointSize: 10
                    }
                }

                Row
                {
                    Image
                    {
                        id: bell
                        y: -7.5
                        width : 30
                        height: 30
                        source: "qrc:/images/Images/Bell.png"
                    }
                    Text
                    {

                        text: " 3000 points"
                        color: "white"
                        font.bold: true
                        font.pointSize: 10
                    }
                }

                Row
                {
                    Image
                    {
                        id: key
                        y: -7.5
                        width : 30
                        height: 30
                        source: "qrc:/images/Images/Key.png"
                    }
                    Text
                    {

                        text: " 5000 points"
                        color: "white"
                        font.bold: true
                        font.pointSize: 10
                    }
                }


            }

   }





        Item{
        id: back
        x: parent.width/2 - 35
        y: parent.height - 70

            ItemForButton
            {
                text: "Back"
                onClicked: {

                    loader.source = "Legend2.qml"
                }
            }
        }


    }





