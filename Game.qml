import QtQuick 2.4
import QtQuick.Window 2.2

Rectangle {
    id: game
    width: 360
    height: 360
    color: "black"

    Item {
        id: sprite
        x: game.width/2
        y: game.height/2
        visible: true
        property alias eating: eating.frameDuration

        AnimatedSprite {
            id: eating
            source: "qrc:images/PacmanSprite.png"
            anchors.centerIn: parent
            frameHeight: 32
            frameWidth: 32
            running: true
            frameCount: 18
            frameDuration: 18
            width: 32
            height: 32
            focus: true
        }

        Keys.onUpPressed: {
            rotation: 270
            y -= 6
        }
        Keys.onDownPressed:{
            rotation: 90
            y += 6
        }
        Keys.onLeftPressed: {
            rotation: 0
            x -= 6
        }
        Keys.onRightPressed: {
            rotation: 180
            x += 6
        }
    }

    ItemForGhost {
        id: red
        x:50
        y:50
        frameY: 512
        speed: 100
        timeX: 1000
        x1Anim: 50
        x2Anim: 300
        animX: true
    }

    ItemForGhost {
        id: green
        x:300
        y:50
        frameY: 640
        speed: 200
        timeY: 1200
        y1Anim: 50
        y2Anim: 300
        animY: true
    }
    ItemForGhost {
        id: blue
        x:50
        y:300
        frameY: 768
        speed: 150
        timeY: 1500
        y1Anim: 300
        y2Anim: 50
        animY: true
    }
    ItemForGhost {
        id: purple
        x:300
        y:300
        frameY: 896
        speed: 300
        timeX: 3000
        x1Anim: 300
        x2Anim: 50
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
                    settings.music ? gameMusic.play() : gameMusic.stop()
                }
            }
            x: 6
            y: 330
    }
}
