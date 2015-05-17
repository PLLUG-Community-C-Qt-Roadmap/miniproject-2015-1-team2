import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0



Rectangle{

    id: legend1
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

                   text: "Character / Nickname"
                   color: "white"
                   font.family: pacmanFont.name
                   font.pointSize: 12
                   x: parent.width/2 - width/2
                   y: 67

               }

    Column
    {
            spacing: 5
            anchors.centerIn: parent



            Row
            {

                SpriteSequence {
                        y: -7.5
                        width: 30
                        height: 30
                        interpolate: false
                        goalSprite: "blinky"
                        Sprite {
                            name: "blinky"
                            source: "qrc:/images/Images/pacman_sprite.png"
                            frameCount: 8
                            frameWidth: 20
                            frameHeight: 20
                            frameX: 0
                            frameY: 80
                            duration: 300
                        }
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

                SpriteSequence {
                        y: -7.5
                        width: 30
                        height: 30
                        interpolate: false
                        goalSprite: "clyde"
                        Sprite {
                            name: "clyde"
                            source: "qrc:/images/Images/pacman_sprite.png"
                            frameCount: 8
                            frameWidth: 20
                            frameHeight: 20
                            frameX: 0
                            frameY: 140
                            duration: 300
                        }
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
                SpriteSequence {
                        y: -7.5
                        width: 30
                        height: 30
                        interpolate: false
                        goalSprite: "pinky"
                        Sprite {
                            name: "pinky"
                            source: "qrc:/images/Images/pacman_sprite.png"
                            frameCount: 8
                            frameWidth: 20
                            frameHeight: 20
                            frameX: 0
                            frameY: 100
                            duration: 300
                        }
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
                SpriteSequence {
                        y: -7.5
                        width: 30
                        height: 30
                        interpolate: false
                        goalSprite: "inky"
                        Sprite {
                            name: "inky"
                            source: "qrc:/images/Images/pacman_sprite.png"
                            frameCount: 8
                            frameWidth: 20
                            frameHeight: 20
                            frameX: 0
                            frameY: 120
                            duration: 300
                        }
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





        Item{
        id: back
        x: parent.width/3 - 35
        y: parent.height - 70

            ItemForButton
            {
                text: "Back"
                onClicked: {

                    loader.source = "MainMenu.qml"
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

                    loader.source = "Legend2.qml"
                }
            }
        }
    }





