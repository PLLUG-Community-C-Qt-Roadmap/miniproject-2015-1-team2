import QtQuick 2.4
import QtQuick.Window 2.2

Rectangle {
    id: game
    width: 360
    height: 360
    color: "black"

    Item{
        ItemForButton {
            text:"Up"
            onClicked: {
                sprite.rotation =  270
                sprite.y -= 6
            }
            x: 150
            y: 280
        }
    }

    Item {
        ItemForButton {
           text:"Down"
           onClicked: {
               sprite.rotation = 90
               sprite.y += 6
           }
        x: 150
        y: 320
        }
    }


    Item {
        ItemForButton {
            text:"Right"
            onClicked: {
                sprite.rotation = 0
                sprite.x += 6
            }
        }
        x: 180
        y: 300
    }

    Item {
        ItemForButton {
            text:"Left"
            onClicked: {
                sprite.rotation = 180
                sprite.x -= 6
            }
        }
        x: 120
        y: 300
    }
    Item {
        id: sprite
        width: 32
        height: 32
        x: game.width/2
        y: game.height/2
        visible: true
        property alias eating: eating.frameDuration

        AnimatedSprite {
            id: eating
            source: "qrc:images/PacmanSprite.png"
            anchors.fill: sprite
            frameHeight: 32
            frameWidth: 32
            running: true
            frameCount: 18
            frameDuration: 18
            width: 32
            height: 32

//            Component.onCompleted: {
//                eating.start();
//            }

//            onRunningChanged: {
//                console.log("Stopped!");
//                eating.running ? true : eating.start();
//            }
        }

        NumberAnimation on x {
            id: pacman
            to: sprite.x + 10
            duration: 1000

            onStopped: {

                sprite.x >= 210 ? console.log("Stopped!") : pacman.start()
            }
        }

    }

    ItemForGhost {
        id: blinky
        x:50
        y:50
        frameY: 80
        speed: 100
        timeX: 1000
        x1Anim: 50
        x2Anim: 300
        frameX: 120
        animX: true
    }

    ItemForGhost {
        id: pinky
        x:300
        y:50
        frameY: 100
        speed: 200
        timeY: 1200
        y1Anim: 50
        y2Anim: 300
        frameX: 40
        animY: true
    }
    ItemForGhost {
        id: inky
        x:50
        y:300
        frameY: 120
        speed: 150
        timeY: 1500
        y1Anim: 300
        y2Anim: 50
        frameX: 0
        animY: true
    }
    ItemForGhost {
        id: clyde
        x:300
        y:300
        frameY: 140
        speed: 300
        timeX: 3000
        x1Anim: 300
        x2Anim: 50
        frameX: 80
        animX: true
    }

    KillGhosts {
        x: 100
        y: 100
    }
    Item {
            ItemForButton {
                text: "Back"
                onClicked: {
                    loader.source = "MainMenu.qml"
                    introMusic.stop()
                    settings.music ? gameMusic.play() : gameMusic.stop()
                }
            }
            x: 35
            y: game.height - 30
    }

    Keys.onUpPressed: {
        sprite.rotation =  270
        sprite.y -= 6
    }
    Keys.onDownPressed:{
        sprite.rotation = 90
        sprite.y += 6
    }
    Keys.onLeftPressed: {
        sprite.rotation = 180
        sprite.x -= 6
    }
    Keys.onRightPressed: {
        sprite.rotation = 0
        sprite.x += 6
    }
    focus: true
}
