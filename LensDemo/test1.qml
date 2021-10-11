import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15


Item{
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.margins: 50

    Text {
        text: sett.get_LensType()
        color: "red"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 50
        font.pixelSize: 20

        Component.onCompleted: {
            console.log(sett.get_LensType());
        }
    }
    ComboBox{
            anchors.top: parent.top
            anchors.right: parent.right
            model: ["Spherical", "Toric", "ASpherical"]
    }
}





