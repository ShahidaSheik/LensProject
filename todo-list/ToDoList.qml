import QtQuick 2.12
import QtQuick 2.7
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import ToDo 1.0

ColumnLayout {
    Frame {
        Layout.fillWidth: true
        ListView {
            clip: true
            implicitHeight: 250
            implicitWidth: 250
            anchors.centerIn: parent
            model: ToDoModel {
                list: toDoList
            }
            delegate: RowLayout
            {
                width: 250

                CheckBox {
                    checked: model.done
                    onClicked: model.done = checked
                }
                TextField {
                    Layout.fillWidth: true
                    text: model.description
                    onEditingFinished: model.description = text

                }
            }
        }
    }
    RowLayout{
        Button{
            text: qsTr("Add an item")
            onClicked: toDoList.appendItems()
            Layout.fillWidth: true
        }
    }
}
