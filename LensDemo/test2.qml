import QtQuick 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls 1.4
import QtQuick.Window 2.15
import Qt.labs.qmlmodels 1.0


//Item{

//    anchors.top: parent.bottom
//    Text {
//        id: t1
//        text: "ProfileType"
//        color: "black"
//        anchors.top: parent.bottom
//        anchors.margins: 19
//        font.pixelSize: 12
//    }
//    ComboBox {
//        anchors.top: parent.bottom
//        anchors.margins: 17
//        currentIndex: 0
//        model: ListModel {
//            id: cbItems
//            ListElement { text: "Spherical"; color: "Yellow" }
//            ListElement { text: "Toric"; color: "Green" }
//            ListElement { text: "Aspherical"; color: "Brown" }
//        }
//        width: 100
//        onCurrentIndexChanged: console.debug(cbItems.get(currentIndex).text + ", " + cbItems.get(currentIndex).color)

//    }

//        Text {
//            text: sett.get_LensType()
//            color: "red"
//            anchors.top: parent.top
//            anchors.right: parent.right
//            anchors.margins: 50
//            font.pixelSize: 20

//            Component.onCompleted: {
//                console.log(sett.get_LensType());
//            }
//        }
//        ComboBox{
//                anchors.top: parent.top
//                anchors.right: parent.right
//                model: ["Spherical", "Toric", "ASpherical"]
//        }
//        Component.onCompleted: Text {
//            text: "Settings"
//            color: "black"
//        }

Item {
    width: 200
    height: 300
    ListView {
        anchors.fill: parent
        model: nestedModel
        delegate: categoryDelegate

    }

    ListModel {
        id: nestedModel
        ListElement {
            categoryName: "Veggies"
            collapsed: false

            // A ListElement can't contain child elements, but it can contain
            // a list of elements. A list of ListElements can be used as a model
            // just like any other model type.
            subItems: [
                ListElement { itemName: "Tomato" ; itemValue: 12 },
                ListElement { itemName: "Cucumber" ; itemValue: 20 },
                ListElement { itemName: "Onion" ; itemValue: 35 },
                ListElement { itemName: "Brains" ; itemValyue : 45}
            ]
        }

        ListElement {
            categoryName: "Fruits"
            collapsed: false
            subItems: [
                ListElement { itemName: "Orange"; itemValue: 21 },
                ListElement { itemName: "Apple"; itemValue: 31 },
                ListElement { itemName: "Pear"; itemValue: 41 },
                ListElement { itemName: "Lemon"; itemValue: 51 }
            ]
        }

        ListElement {
            categoryName: "Cars"
            collapsed: false
            subItems: [
                ListElement { itemName: "Nissan"; itemValue: 56 },
                ListElement { itemName: "Toyota"; itemValue: 67 },
                ListElement { itemName: "Chevy"; itemValue: 78 },
                ListElement { itemName: "Audi"; itemValue: 89 }
            ]
        }
    }

    Component {
        id: categoryDelegate
        Column {
            width: 200

            Rectangle {
                id: categoryItem
                border.color: "black"
                border.width: 5
                color: "white"
                height: 50
                width: 200

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    x: 15
                    font.pixelSize: 24
                    text: categoryName
                }

                Rectangle {
                    color: "red"
                    width: 30
                    height: 30
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    anchors.verticalCenter: parent.verticalCenter

                    MouseArea {
                        anchors.fill: parent

                        // Toggle the 'collapsed' property
                        onClicked: nestedModel.setProperty(index, "collapsed", !collapsed)
                    }
                }
            }

            Loader {
                id: subItemLoader

                // This is a workaround for a bug/feature in the Loader element. If sourceComponent is set to null
                // the Loader element retains the same height it had when sourceComponent was set. Setting visible
                // to false makes the parent Column treat it as if it's height was 0.
                visible: !collapsed
                property variant subItemModel : subItems
                sourceComponent: collapsed ? null : subItemColumnDelegate
                onStatusChanged: if (status == Loader.Ready) item.model = subItemModel
            }
        }

    }

    Component {
        id: subItemColumnDelegate


        Column {
            property alias model : subItemRepeater.model
            width: 200
            DelegateChooser {
                id: chooser
                role: "itemName"

        }

            Repeater {
                id: subItemRepeater
                DelegateChoice { roleValue: "Tomato";
                     delegate  {
                         Rectangle {
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
                               // anchors.right: t.right
                                model: ["Data", "Diopter", "Settings"]
                            }
                        }
                      }
                    }
                }

//                    DelegateChoice { roleValue: "Cucumber";
//                        delegate:
//                            Row {


//                            Text {
//                                id: t1;
//                                anchors.top:c.bottom
//                                text: itemName
//                            }
//                            ComboBox {
//                                id: c1;
//                               anchors.top: t1.top
//                               anchors.left: t1.right + 100
//                               height: 20
//                               //anchors.left: t1.right
//            //                    anchors.right:t1.right
//                                model: ["Spherical", "Toric", "ASpherical"]
//                            }
//                        }
//                    }


//                }

                delegate: Rectangle
                {
                    color: "#cccccc"
                    height: 40
                    width: 200
                    border.color: "black"
                    border.width: 2

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        x: 30
                        font.pixelSize: 18
                        text: itemName
                    }
                    Component.onCompleted: {
                        var val = itemValue;
                        var name = itemName;
                        console.log("Name : " + name + " Value : " + val);
                        if(name == "Tomato")
                            console.log("TOMATO");
                        if(name ==  "Cucumber")
                            console.log("CUCUMBER");
                        if(name == "Onion")
                            console.log("ONION");
                        if(name ==  "Brains")
                            console.log("BRAINS");
                    }

                    Text {
                        anchors.verticalCenter: parent.horizontalCenter
                        x: 120
                        font.pixelSize: 18
                        text: itemValue
                    }
                }

}

    }
}
}



