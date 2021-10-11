import QtQuick 2.0

Text {
    clip: true
    text: model.front
    font.pixelSize: 24

    property bool expanded: false

    height: expanded? implicitHeight : 0

    Behavior on height {
        NumberAnimation { duration : 200}
    }
}
