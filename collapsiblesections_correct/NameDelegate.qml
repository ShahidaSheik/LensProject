import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQml.Models 2.11
import Qt.labs.qmlmodels 1.0

Text {
    clip: true
    text: model.front
    font.pixelSize: 15

    property bool expanded: false

    height: expanded ? implicitHeight : 0

    Behavior on height {
        NumberAnimation { duration : 100}
    }
}
