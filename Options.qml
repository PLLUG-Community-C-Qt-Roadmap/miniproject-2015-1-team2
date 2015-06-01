import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

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
        font {
            family: pacmanFont.name
            pointSize: 20
        }
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Options"
    }

    GridLayout {
        id: gridLayout
        columns: 2
        rows: 5
        rowSpacing: 25
        columnSpacing: 80
        anchors {
            centerIn: parent
            left: parent.left
            leftMargin: 5
            right: parent.right
        }

        Text {
            id : difficultyLabel
            color: "yellow"
            font {
                family: pacmanFont.name
                pointSize: 15
            }
            text: "Difficulty"
        }

        OptionsLevelItem {
            id: levelComboBox
            level: settings.difficulty

            onDifficultyChanged: {
                options.difficultyChanged(currentLevel)
            }
        }

        Text {
            id : musicLabel
            color: "yellow"
            font {
                family: pacmanFont.name
                pointSize: 15
            }
            text: "Music"
        }

        CheckBox {
            id: musicCheckBox
            checked : settings.music

            onCheckedChanged: {
                options.musicChanged(musicCheckBox.checked)
            }
        }

        Text {
            id : soundEffectsLabel
            color: "yellow"
            font {
                family: pacmanFont.name
                pointSize: 15
            }
            text: "Sound Effects"
        }

        CheckBox {
            id: soundEffectsCheckBox
            checked : settings.soundEffects

            onCheckedChanged: {
                options.soundEffectsChanged(soundEffectsCheckBox.checked)
            }
        }

        Text {
            id : volumeLabel
            color: "yellow"
            font {
                family: pacmanFont.name
                pointSize: 15
            }
            text: "Volume"
        }

        Slider {
            id: volumeSlider
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
            font {
                family: pacmanFont.name
                pointSize: 15
            }
            text: "Fullscreen"
        }

        CheckBox {
            id: fullscreenCheckBox
            checked: settings.fullscreen

            onCheckedChanged: {
                options.fullscreenChanged(fullscreenCheckBox.checked)
            }
        }
    }

    ItemForButton {
        text: "Back"
        anchors {
            horizontalCenter: options.horizontalCenter
            bottom: options.bottom
            bottomMargin: 30
        }

        onClicked: {
            options.optionsClosed()
            loader.source = "MainMenu.qml"
        }
    }

}
