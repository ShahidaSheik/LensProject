import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.qmlmodels 1.0

ListView {
    width: 200; height: 400
    header:

        Text {
          height: 20
          color: "red"
          text: "LensType"
        }
    ListModel {
        id: listModel
        ListElement { type: "info"; itemName: "Lens" }
        ListElement { type: "Lens"; itemName: "ASpherical" }
        ListElement { type: "Check"; itemName: "Toric" }
    }

    DelegateChooser {
        id: chooser
        role: "type"
        DelegateChoice { roleValue: "info"; ItemDelegate {
                Rectangle {
                    color: "lightblue"
                    height: 200
                    width: 200
                Row {

                    Text
                    {
                        id:t
                        text: itemName
                    }
                    ComboBox{
                        id:c;
                         height: 20
                        anchors.top: t.top
                        anchors.left: t.right + 70
                       // anchors.left: t.right
//                        anchors.right: t.right
                        model: ["Data", "Diopter", "Settings"]
                    }
                }
            }
            }
        }
        DelegateChoice { roleValue: "Lens";
            delegate:
                Row {
                id: r1;

                Text {
                    id: t1;
                    anchors.top:c.bottom
                    text: itemName
                }
                ComboBox {
                    id: c1;
                   anchors.top: t1.top
                   anchors.left: t1.right + 100
                   height: 20
                   //anchors.left: t1.right
//                    anchors.right:t1.right
                    model: ["Spherical", "Toric", "ASpherical"]
                }
            }
        }

        DelegateChoice { roleValue: "Check"; CheckDelegate {
                tristate: true

                checkState: allChildrenChecked ? Qt.Checked :
                                                 anyChildChecked ? Qt.PartiallyChecked : Qt.Unchecked

                nextCheckState: function() {
                    if (checkState === Qt.Checked)
                        return Qt.Unchecked
                    else return Qt.Checked
                }
                Text {
                    anchors.top: c1.bottom

//                    anchors.left:r1.left
//                    anchors.right: r1.right
                    text: itemName
                }
            }
      }
    }
    model: listModel
    delegate: chooser
}

