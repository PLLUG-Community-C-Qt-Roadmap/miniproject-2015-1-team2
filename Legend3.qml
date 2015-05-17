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

                        SpriteSequence {
                                y: -7.5
                                width: 30
                                height: 30
                                interpolate: false
                                goalSprite: "cherry"
                                Sprite {
                                    name: "cherry"
                                    source: "qrc:/images/Images/pacman_sprite.png"
                                    frameCount: 1
                                    frameWidth: 20
                                    frameHeight: 20
                                    frameX: 170
                                    frameY: 160
                                }
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
                        SpriteSequence {
                                y: -7.5
                                width: 30
                                height: 30
                                interpolate: false
                                goalSprite: "strawberry"
                                Sprite {
                                    name: "strawberry"
                                    source: "qrc:/images/Images/pacman_sprite.png"
                                    frameCount: 1
                                    frameWidth: 20
                                    frameHeight: 20
                                    frameX: 170
                                    frameY: 180
                                }
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
                        SpriteSequence {
                                y: -7.5
                                width: 30
                                height: 30
                                interpolate: false
                                goalSprite: "peach"
                                Sprite {
                                    name: "peach"
                                    source: "qrc:/images/Images/pacman_sprite.png"
                                    frameCount: 1
                                    frameWidth: 20
                                    frameHeight: 20
                                    frameX: 170
                                    frameY: 200
                                }
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
                        SpriteSequence {
                                y: -7.5
                                width: 30
                                height: 30
                                interpolate: false
                                goalSprite: "apple"
                                Sprite {
                                    name: "apple"
                                    source: "qrc:/images/Images/pacman_sprite.png"
                                    frameCount: 1
                                    frameWidth: 20
                                    frameHeight: 20
                                    frameX: 170
                                    frameY: 220
                                }
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
                Row
                {
                    SpriteSequence {
                            y: -7.5
                            width: 30
                            height: 30
                            interpolate: false
                            goalSprite: "galaxianBoss"
                            Sprite {
                                name: "cherry"
                                source: "qrc:/images/Images/pacman_sprite.png"
                                frameCount: 1
                                frameWidth: 20
                                frameHeight: 20
                                frameX: 210
                                frameY: 180
                            }
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
                    SpriteSequence {
                            y: -7.5
                            width: 30
                            height: 30
                            interpolate: false
                            goalSprite: "bell"
                            Sprite {
                                name: "cherry"
                                source: "qrc:/images/Images/pacman_sprite.png"
                                frameCount: 1
                                frameWidth: 20
                                frameHeight: 20
                                frameX: 210
                                frameY: 200
                            }
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
                    SpriteSequence {
                            y: -7.5
                            width: 30
                            height: 30
                            interpolate: false
                            goalSprite: "key"
                            Sprite {
                                name: "key"
                                source: "qrc:/images/Images/pacman_sprite.png"
                                frameCount: 1
                                frameWidth: 20
                                frameHeight: 20
                                frameX: 210
                                frameY: 220
                            }
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





