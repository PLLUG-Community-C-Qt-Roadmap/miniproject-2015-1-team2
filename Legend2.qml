import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0



Rectangle{

    id: legend2
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

                   text: "Vulnerable ghosts"
                   color: "white"
                   font.family: pacmanFont.name
                   font.pointSize: 12
                   x: parent.width/2 - width/2
                   y: 67

               }

    Row
    {

            anchors.centerIn:  parent
            spacing: 40


            Column
            {
                id: ghostGolumn
                Row{

                    Text
                    {   id:subtext

                        text: "1х "
                        color: "white"
                        font.bold: true
                        font.pointSize: 10
                    }



                    SpriteSequence {
                            id: sprite
                            y: -7.5
                            width: 30
                            height: 30
                            interpolate: false
                            goalSprite: "sp1"
                            Sprite {
                                id: sp1
                                name: "sp1"
                                source: "qrc:/images/Images/pacman_sprite.png"
                                frameCount: 2
                                frameWidth: 20
                                frameHeight: 20
                                frameX: 0
                                frameY: 161
                                duration: 300
                            }
                        }
                }

                Row{



                    Text
                    {

                        text: "2х "
                        color: "white"
                        font.bold: true
                        font.pointSize: 10
                    }

                    SpriteSequence {
                            y: -7.5
                            width: 30
                            height: 30
                            interpolate: false
                            goalSprite: "sp1"
                            Sprite {
                                name: "sp1"
                                source: "qrc:/images/Images/pacman_sprite.png"
                                frameCount: 2
                                frameWidth: 20
                                frameHeight: 20
                                frameX: 0
                                frameY: 161
                                duration: 300
                            }
                }
                }

                Row{



                    Text
                    {

                        text: "3х "
                        color: "white"
                        font.bold: true
                        font.pointSize: 10
                    }

                    SpriteSequence {

                            y: -7.5
                            width: 30
                            height: 30
                            interpolate: false
                            goalSprite: "sp1"
                            Sprite {
                                name: "sp1"
                                source: "qrc:/images/Images/pacman_sprite.png"
                                frameCount: 2
                                frameWidth: 20
                                frameHeight: 20
                                frameX: 0
                                frameY: 161
                                duration: 300
                            }
                }
                }

                Row{

                    Text
                    {

                        text: "4х "
                        color: "white"
                        font.bold: true
                        font.pointSize: 10
                    }

                    SpriteSequence {
                            y: -7.5
                            width: 30
                            height: 30
                            interpolate: false
                            goalSprite: "sp1"
                            Sprite {
                                name: "sp1"
                                source: "qrc:/images/Images/pacman_sprite.png"
                                frameCount: 2
                                frameWidth: 20
                                frameHeight: 20
                                frameX: 0
                                frameY: 161
                                duration: 300
                            }
                    }
                }

            }

            Column
            {
                id: scoresForGhosts
                spacing: ghostGolumn.spacing + 15
                Text
                {

                    text: "200 points"
                    color: "white"
                    font.bold: true
                    font.pointSize: 10
                }

                Text
                {

                    text: "400 points"
                    color: "white"
                    font.bold: true
                    font.pointSize: 10
                }

                Text
                {

                    text: "800 points"
                    color: "white"
                    font.bold: true
                    font.pointSize: 10
                }

                Text
                {

                    text: "1600 points"
                    color: "white"
                    font.bold: true
                    font.pointSize: 10
                }
            }

   }





        Item{
        id: back
        x: parent.width/3 - 35
        y: parent.height - 70

            ItemForButton
            {
                text: "Back"
                onClicked: {

                    loader.source = "Legend1.qml"
                }
            }
        }

        Item{
        id: next
        x: parent.width/1.5 - 35
        y: parent.height - 70
            ItemForButton
            {
                text: "Next"
                onClicked: {

                    loader.source = "Legend3.qml"
                }
            }
        }
    }





