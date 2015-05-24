import QtQuick 2.4
import QtQuick.Window 2.2
import "FieldCollisionAndObjects.js" as Field

Rectangle {
    id: game
    width: 448
    height: 496
    color: "black"

    // Map implemantation
    Image {
        source: "qrc:/images/Images/field.png"

        anchors.fill: parent

        GridView{
            id: idField
            interactive: false
            anchors.fill: parent
            cellHeight: Field.tiles["tileheight"]
            cellWidth: Field.tiles["tilewidth"]
            delegate: fieldDelegate
            model: TileField.tilesNumber()
        }

        Component {
            id: fieldDelegate
            Item {
                width: idField.cellWidth;
                height: idField.cellHeight

                Image{
                    anchors.fill: parent
                    source: TileField.tileHasDot(index) ? "qrc:/images/Images/dot.png" : TileField.tileHasEnergizer(index) ? "qrc:/images/Images/energizer.png" : ""
                    visible: !TileField.tileIsWall(index) || !TileField.tileIsEmptyPass(index)
                }
            }
        }
    }

    Item{
        ItemForButton {
            text:"Up"
            onClicked: {
                sprite.rotation =  270
                up.running = true
                down.running = false
                left.running = false
                right.running = false
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
               up.running = false
               down.running = true
               left.running = false
               right.running = false
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
                up.running = false
                down.running = false
                left.running = false
                right.running = true
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
                up.running = false
                down.running = false
                left.running = true
                right.running = false
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
        rotation: 180
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

       /*` NumberAnimation on x {
            id: pacman
            to: sprite.x + 10
            duration: 1000

            onStopped: {

                sprite.x >= 210 ? console.log("Stopped!") : pacman.start()
            }
        }*/

        NumberAnimation on y {
            id: up
            to: sprite.y - 300
            duration: 3000
            running: false
        }

        NumberAnimation on y {
            id: down
            to: sprite.y + 300
            duration: 3000
            running: false
        }

        NumberAnimation on x {
            id: left
            to: sprite.x - 300
            duration: 3000
            running: true
        }

        NumberAnimation on x {
            id: right
            to: sprite.x + 300
            duration: 3000
            running: false
        }

    }

    ItemForGhost {
        id: blinky
        x: game.width / 2 - 30
        y: game.height / 2 - 25
        frameX: 0
        frameY: 80
        speed: 100
    }

    ItemForGhost {
        id: pinky
        x: game.width / 2 + 30
        y: game.height / 2 - 25
        frameX: 0
        frameY: 100
        speed: 200
    }
    ItemForGhost {
        id: inky
        x: game.width / 2 - 30
        y: game.height / 2 - 5
        frameX: 0
        frameY: 120
        speed: 150
    }
    ItemForGhost {
        id: clyde
        x: game.width / 2 + 30
        y: game.height / 2 - 5
        frameX: 0
        frameY: 140
        speed: 300   
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

    Item {
        ItemForButton {
            text: "Pause"
            onClicked: {
                introMusic.stop()
                up.running = false
                down.running = false
                left.running = false
                right.running = false
                inky.animX = false
                inky.animY = false
                pinky.animX = false
                pinky.animY = false
                blinky.animX = false
                blinky.animY = false
                clyde.animX = false
                clyde.animY = false
            }
        }
        x:20
        y: 20
    }

    Keys.onUpPressed: {
        sprite.rotation =  270
        up.running = true
        down.running = false
        left.running = false
        right.running = false
    }
    Keys.onDownPressed:{
        sprite.rotation = 90
        up.running = false
        down.running = true
        left.running = false
        right.running = false
    }
    Keys.onLeftPressed: {
        sprite.rotation = 180
        up.running = false
        down.running = false
        left.running = true
        right.running = false
    }
    Keys.onRightPressed: {
        sprite.rotation = 0
        up.running = false
        down.running = false
        left.running = false
        right.running = true
    }
    focus: true
}
