import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Rectangle {

    id: options
    width: 360
    height: 360
    color: "black"

    signal optionsClosed()
    signal difficultyChanged(int changedLevel)
    signal volumeChanged(int changedVolume)
    signal fullscreenChanged(bool changedFullscreen)
    signal musicChanged(bool changedMusic)
    signal soundEffectsChanged(bool changedSoundEffects)

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

        id: levelComboBox

        x : options.width - width - 5
        y: difficultyLabel.y

        level: settings.difficulty

        onDifficultyChanged: {

            options.difficultyChanged(currentLevel)
        }
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

        id: musicCheckBox

        x : options.width - width - 5
        y: musicLabel.y

        checked : settings.music

        onCheckedChanged: {

            options.musicChanged(musicCheckBox.checked)
        }
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
        id: soundEffectsCheckBox

        x : options.width - width - 5
        y: soundEffectsLabel.y

        checked : settings.soundEffects

        onCheckedChanged: {

            options.soundEffectsChanged(soundEffectsCheckBox.checked)
        }
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
        id: volumeSlider

        x : options.width - width - 5
        y: volumeLabel.y

        minimumValue: 0
        maximumValue: 100
        stepSize: 1

        value : settings.volume

        updateValueWhileDragging : true

        onValueChanged: {

            options.volumeChanged(volumeSlider.value)
        }
    }

    Text {
        id : fullscreenLabel
        color: "yellow"
        font.family: pacmanFont.name
        font.pointSize: 15
        text: "Fullscreen"

        x: 5
        y: volumeLabel.y + 40
    }

    CheckBox {
        id: fullscreenCheckBox

        x : options.width - width - 5
        y: fullscreenLabel.y

        checked: settings.fullscreen

        onCheckedChanged: {

            options.fullscreenChanged(fullscreenCheckBox.checked)
        }
    }

    ItemForButton {
        text: "Back"

        anchors.horizontalCenter: options.horizontalCenter
        anchors.bottom: options.bottom
        anchors.bottomMargin: 30

        onClicked: {
            options.optionsClosed()
            loader.source = "MainMenu.qml"
        }
    }

}
