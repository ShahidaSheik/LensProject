import QtQuick 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12

ColumnLayout
{
    anchors {
        left: parent.left
        right:parent.right
    }

    Rectangle {
        height: 23
        anchors {
            left: parent.left
            right:parent.right
        }
        width:  350
        color: "moccasin"
        Text {
           text: "Anterior"
           font.pixelSize: 17
           font.bold: true
           color: "black"
        }
    }

    RowLayout {
        id: rowAnterior
        width: parent.width
        anchors {
            left: parent.left
            right:parent.right
        }
        Text {
            id: t2
            clip: true
            text: "Profile Type"
            leftPadding: 10
            font.pixelSize: 15
            height: implicitHeight
        }
        ComboBox {
            clip: true
            anchors.right:parent.right
            height: implicitHeight
            model: ["Spherical", "Toric", "ASpherical"]
            onActivated: {
                model.value = editText;
                anteriorspherical.setProfileType(editText);
                if(editText == "Spherical")
                {
                   anteriorLoader.source = "anteriorSphericalView.qml";
                }
                else if(editText == "Toric")
                {
                   anteriorLoader.source = "anteriorToricView.qml";
                }
                else if(editText == "ASpherical")
                {
                   anteriorLoader.source = "anteriorAsphericalView.qml";
                }
            }
            Component.onCompleted: {
                console.log("Profile Type value " + model.value + "Backend value Profile Type " + anterioraspheric.get_ProfileType());
            }
        }
    }

    Loader {
        id: anteriorLoader
        width: 300
        height: 400

        anchors {
            left: parent.left
            right: parent.right
            top: rowAnterior.bottom
        }

        source: "anteriorSphericalView.qml"
    }



}
