import QtQuick 2.0

Rectangle {
    color: "light blue"
    implicitHeight: 20
    property alias text: txt.text
    signal clicked()
    Text {
        id: txt
        anchors.centerIn: parent
        font.pixelSize: 16
        font.bold: true
    }
    MouseArea {
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}
