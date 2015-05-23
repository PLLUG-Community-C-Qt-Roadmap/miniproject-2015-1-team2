import QtQuick 2.4
import QtQuick.Window 2.2
import "FieldCollisionAndObjects.js" as Field

Window {
    visible: true

    width: 448
    height: 496

    color: "black"

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
}
