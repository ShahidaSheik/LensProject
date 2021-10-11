import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQml.Models 2.11
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.4
import Qt.labs.qmlmodels 1.0


Rectangle{
    id: appWindow2
    visible: false

    ListModel {
        id: lenstype
        ListElement { front: "Profile Type"; prop: "Data" }
        ListElement { front: "Diopter"; prop: "Lens Diopter" }
        ListElement { front: "Fluid Index of Refraction"; prop: "Lens Diopter" }
        ListElement { front: "Material Index of Refraction"; prop: "Lens Diopter" }
        ListElement { front: "Specify Diopter"; prop: "Lens Diopter" }
        ListElement { front: "Lathe Recipe"; prop: "Settings" }
        ListElement { front: "Measure Surface"; prop: "Settings" }
        ListElement { front: "Radius"; prop: "Settings" }
    }

    Component {
        id: nameDelegate
        Text {
            readonly property ListView __lv: ListView.view
            width: parent.width
            text: model.front;
//            font.pixelSize: 24

            MouseArea {
                anchors.fill: parent
                onClicked: __lv.currentIndex = index
            }
        }
    }
    //--> slide
    ListView {
        model: lenstype
        delegate: nameDelegate
        //--> hide
        anchors.fill: parent
        focus: true
        clip: true
        //<-- hide
        highlight: Rectangle {//--> collapse
            color: "lightblue"
            width: parent.width
        }//<-- collapse
        section.property: "prop"
        section.criteria: ViewSection.FullString

        section.delegate: Rectangle {
            color: "#b0dfb0"
            width: parent.width
            implicitHeight: text.implicitHeight + 4
            Text {
                id: text
                anchors.centerIn: parent
//                font.pixelSize: 16
//                font.bold: true
                text: section
            }
        }
    }

//    Component.onCompleted: {
//        appWindow2.visible = true;
//        var component = Qt.createComponent("test2.qml");
//        var sprite = component.createObject(appWindow2, {x: parent.top , y: parent.left });
//        if (sprite === null) {
//            console.log("Error creating object");
//        }
//    }

}
//                TreeView {
//                    id: anteriorm
//                    model: lensmodel
//                    selectionMode: SelectionMode.SingleSelection
//                    selection: ItemSelectionModel{
//                        id:mySelectionModel
//                        model: lensmodel
//                    }
//                    TableViewColumn{
//                        role: "name"

//                    }
//                    Component.onCompleted: {
//                        expandAll();
//                        var ix1 = lensmodel.index(0, 0, anteriorm.rootIndex)
//                        var ix = lensmodel.index(0, 0, ix1)
//                        mySelectionModel.select(ix, ItemSelectionModel.Select)
//                        appWindow2.visible = true;
//                        var component = Qt.createComponent("test2.qml");
//                        var sprite = component.createObject(appWindow2, {x: antid.left, y: antid.bottom});
//                           if (sprite === null) {
//                              console.log("Error creating object");
//                           }

//                    }
//                    TableViewColumn {
//                        role: "value"
//                    }
//                    DelegateChooser {
//                        id: chooser
//                        role: "value"
//                        DelegateChoice { roleValue: "Misc"; ItemDelegate {
//                                Rectangle {
//                                    color: "lightblue"
//                                    height: 200
//                                    width: 200
//                                Row {

//                                    Text
//                                    {
//                                        id:t
//                                        text: Value
//                                    }
//                                    ComboBox{
//                                        id:c;
//                                         height: 20
//                                        anchors.top: t.top
//                                        anchors.left: t.right + 70
//                                       // anchors.left: t.right
//                //                        anchors.right: t.right
//                                        model: ["X", "Y", "Z"]
//                                    }
//                                }
//                            }
//                            }
//                        }
//                        DelegateChoice { roleValue: "MyLens"; ItemDelegate {
//                                Rectangle {
//                                    color: "lightblue"
//                                    height: 200
//                                    width: 200
//                                Row {

//                                    Text
//                                    {
//                                        id:t1
//                                        text: Value
//                                    }
//                                    ComboBox{
//                                        id:c1;
//                                         height: 20
//                                        anchors.top: t1.top
//                                        anchors.left: t1.right
//                                       // anchors.left: t.right
//                //                        anchors.right: t.right
//                                        model: ["A", "B", "C"]
//                                    }
//                                }
//                            }
//                            }
//                        }
//                        DelegateChoice { roleValue: 6;
//                            delegate:
//                                Row {
//                                id: r1;

//                                Text {
//                                    id: t2;
//                                    anchors.top:c.bottom
//                                    text: Value
//                                }
//                                ComboBox {
//                                    id: c2;
//                                   anchors.top: t2.top
//                                   anchors.left: t2.right
//                                   height: 20
//                                   //anchors.left: t1.right
//                //                    anchors.right:t1.right
//                                    model: ["Spherical", "Toric", "ASpherical"]
//                                }
//                            }
//                        }
//                        DelegateChoice { roleValue: "Settings"; ItemDelegate {
//                                Rectangle {
//                                    color: "lightblue"
//                                Row {

//                                    Text
//                                    {
//                                        id:t3
//                                        text: Value
//                                    }

//                                }
//                            }
//                            }
//                        }
//                        DelegateChoice { roleValue: "14.3"; CheckDelegate {
//                                tristate: true

//                                checkState: allChildrenChecked ? Qt.Checked :
//                                                                 anyChildChecked ? Qt.PartiallyChecked : Qt.Unchecked

//                                nextCheckState: function() {
//                                    if (checkState === Qt.Checked)
//                                        return Qt.Unchecked
//                                    else return Qt.Checked
//                                }
//                                Text {
//                                    id: t4;
//                                    anchors.top: t3.bottom
//                                    text: Value
//                                }
//                            }
//                        }
//                        DelegateChoice { roleValue: 5.5; CheckDelegate {
//                                tristate: true

//                                checkState: allChildrenChecked ? Qt.Checked :
//                                                                 anyChildChecked ? Qt.PartiallyChecked : Qt.Unchecked

//                                nextCheckState: function() {
//                                    if (checkState === Qt.Checked)
//                                        return Qt.Unchecked
//                                    else return Qt.Checked
//                                }
//                                Text {
//                                    anchors.top: t4.bottom
//                                    text: Value
//                                }
//                            }
//                     }
//                    }



//                itemDelegate: Item {
//                    Text {
//                        anchors.fill: parent
//                        color: styleData.textColor
//                        elide: styleData.elideMode
//                        text: styleData.value

//                    }
//                }
//                onClicked: {
//                    appWindow2.visible = true;
//                    if (index.parent.row >= 0) {
//                        if (index.row >= 0) {
//                            console.log("data selected: " + lensmodel.data(index));
//                            var component = Qt.createComponent("test2.qml");
//                            var sprite = component.createObject(appWindow2, {x: 300, y: 100});
//                            if (sprite === null) {
//                                console.log("Error creating object");
//                            }
//                        }
//                    }
//                }


//        function expandAll() {
//            for(var i=0; i < lensmodel.rowCount(); i++) {
//                var index = lensmodel.index(i,0)
//                if(!anteriorm.isExpanded(index)) {
//                    anteriorm.expand(index)
//                }
//            }
//        }
//}

//}




