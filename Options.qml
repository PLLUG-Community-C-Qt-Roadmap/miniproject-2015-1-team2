import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Rectangle {

    id: options
    width: 360
    height: 360
    color: "black"

    Text {
        id : optionsLabel
        color: "red"
        font.family: pacmanFont.name
        font.pointSize: 20
        anchors.horizontalCenter: options.horizontalCenter
        text: "Options"
    }

    Text {
        id : difficultyLabel
        color: "yellow"
        font.family: pacmanFont.name
        font.pointSize: 15
        text: "Difficulty"

        x: 5
        y: optionsLabel.height + 30
    }

    OptionsLevelItem {

        x : options.width - width - 5
        y: difficultyLabel.y
    }

    Text {
        id : musicLabel
        color: "yellow"
        font.family: pacmanFont.name
        font.pointSize: 15
        text: "Music"

        x: 5
        y: difficultyLabel.y + 40
    }

    CheckBox {

        checked: true

        x : options.width - width - 5
        y: musicLabel.y
    }

    Text {
        id : soundEffectsLabel
        color: "yellow"
        font.family: pacmanFont.name
        font.pointSize: 15
        text: "Sound Effects"

        x: 5
        y: musicLabel.y + 40
    }

    CheckBox {

        checked: true

        x : options.width - width - 5
        y: soundEffectsLabel.y
    }

    Text {
        id : volumeLabel
        color: "yellow"
        font.family: pacmanFont.name
        font.pointSize: 15
        text: "Volume"

        x: 5
        y: soundEffectsLabel.y + 40
    }

    Slider {

        value: 0.5

        x : options.width - width - 5
        y: volumeLabel.y
    }

    Text {
        id : fullscreenLabel
        color: "yellow"
        font.family: pacmanFont.name
        font.pointSize: 15
        text: "Sound Effects"

        x: 5
        y: volumeLabel.y + 40
    }

    CheckBox {

        checked: true

        x : options.width - width - 5
        y: fullscreenLabel.y
    }

    ItemForButton {
        text: "Back"

        anchors.horizontalCenter: options.horizontalCenter
        anchors.bottom: options.bottom
        anchors.bottomMargin: 30

        onClicked: {
            loader.source = "MainMenu.qml"
        }
    }

}
