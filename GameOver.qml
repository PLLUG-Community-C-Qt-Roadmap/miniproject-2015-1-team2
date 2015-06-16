import QtQuick 2.4
import QtQuick.Window 2.2


Rectangle {
    id:gameOver
    color: "black"
    width: 250
    height: 100

    anchors.centerIn: parent

    border {
        color: "white"
        width: 1
    }

    Text {
        text: "Game over"
        color: "red"
        font.family:  pacmanFont.name
        font.pointSize: 8
        x: parent.width/2 - width/2
        y: 15

    }

    GameButton {
        text: "Ok"
        onClicked: {
            loader.source = "MainMenu.qml"
            loaderForExitWindow.source = ""
            introMusic.stop()
            settings.music ? gameMusic.play() : gameMusic.stop()
        }
        x: gameOver.width - 125 - width
        y: gameOver.height - 30
    }
}

