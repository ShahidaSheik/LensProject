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
           text: "Haptic"
           font.pixelSize: 17
           font.bold: true
           color: "black"
        }
    }

    RowLayout {
        id: rowHaptic
        width: parent.width
        Text {
            clip: true
            text: "Type"
            leftPadding: 10
            font.pixelSize: 15
            height: implicitHeight
        }
        ComboBox {
            clip: true
            anchors.right:parent.right
            height: implicitHeight
            model: ["Flat", "Vaulted", "Curved"]
            onActivated: {
                model.value = editText;
                hapticflat.setType(editText);
                if(editText == "Flat")
                {
                   hapticLoader.source = "hapticFlatView.qml";
                }
                else if(editText == "Vaulted")
                {
                   hapticLoader.source = "hapticVaultedView.qml";
                }
                else if(editText == "Curved")
                {
                   hapticLoader.source = "hapticCurvedView.qml";
                }
            }
            Component.onCompleted: {
                console.log("Profile Type value " + model.value + "Backend value Profile Type " + hapticflat.get_type());
            }
        }
    }

    Loader {
        id: hapticLoader
        width: 300
        height: 400

        anchors {
            left: parent.left
            right: parent.right
            top: rowHaptic.bottom
        }
        source: "hapticFlatView.qml"
    }
}
