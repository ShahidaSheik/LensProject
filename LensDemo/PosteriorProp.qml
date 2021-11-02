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
           text: "Posterior"
           font.pixelSize: 17
           font.bold: true
           color: "black"
        }
    }

    RowLayout {
        id: rowPosterior
        width: parent.width
        Text {
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
                posteriorspherical.setProfileType(editText);
                if(editText == "Spherical")
                {
                   posteriorLoader.source = "posteriorSphericalView.qml";
                }
                else if(editText == "Toric")
                {
                   posteriorLoader.source = "posteriorToricView.qml";
                }
                else if(editText == "ASpherical")
                {
                   posteriorLoader.source = "posteriorAsphericalView.qml";
                }
            }
            Component.onCompleted: {
                console.log("Profile Type value " + model.value + "Backend value Profile Type " + posteriorspherical.get_ProfileType());
            }
        }
    }

    Loader {
        id: posteriorLoader
        width: 300
        height: 400

        anchors {
            left: parent.left
            right: parent.right
            top: rowPosterior.bottom
        }
        source: "posteriorSphericalView.qml"
    }



}
