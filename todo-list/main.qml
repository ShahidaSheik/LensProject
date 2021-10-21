import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ToDoList {
        anchors.centerIn: parent
    }
}
