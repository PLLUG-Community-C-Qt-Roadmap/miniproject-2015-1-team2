import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1

Window{


    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }

    id: history

    visible: true
    width: 360
    height: 360

    ColumnLayout
    {
        Text
        {
            text: "History"
            font.family: pacmanFont.name
            font.pointSize: 35


        }

        Item
        {
            ItemForButton
            {
                text: "Back"
                onClicked: {

                    history.close()
                }
            }
        }

        Item
        {
            ItemForButton
            {
                text: "Next"
            }
        }


    }



}
