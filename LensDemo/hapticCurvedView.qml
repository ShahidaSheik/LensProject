import QtQuick 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12

ColumnLayout
{
    ListModel {
        id: hapCurved
        ListElement { front: "Diameter"; prop: "Settings"; value: 12 }
        ListElement { front: "Radius"; prop: "Settings"; value: 18.7 }
        ListElement { front: "Rise"; prop: "Settings"; value: 0.25 }
        ListElement { front: "Thickness"; prop: "Settings"; value: 0.17 }
    }

    ListView
    {
        id: hCurved
        visible: true;
        property var collapsed : ({})
        width: 300
        height: 380

        model: hapCurved
        DelegateChooser {
            id: hapcurveddelegate
            role: "front"

            DelegateChoice { roleValue: "Diameter";
                ItemDelegate {
                    height: hCurved.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: hCurved.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            width: parent.width / 2
                            text: hapticcurved.diameter
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseInt(text,10);
                                hapticcurved.setDiameter(parseInt(text,10));
                                console.log("Diameter is now " + model.value);
                                console.log("Diameter in model is now " + hapticcurved.get_diameter());
                            }
                            Component.onCompleted: {
                                console.log("Diameter value " + model.value + "Backend value Diameter " + hapticcurved.get_diameter());
                            }
                        }
                    }
                }
            }

            DelegateChoice { roleValue: "Radius";
                ItemDelegate {
                    height: hCurved.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: hCurved.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            width: parent.width / 2
                            text: hapticcurved.radius
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                hapticcurved.setRadius(parseFloat(text,10));
                                console.log("Radius is now " + model.value);
                                console.log("Radius in model is now " + hapticcurved.get_radius());
                            }
                            Component.onCompleted: {
                                console.log("Radius value " + model.value + "Backend value Radius " + hapticcurved.get_radius());
                            }
                        }
                    }
                }
            }

            DelegateChoice { roleValue: "Rise";
                ItemDelegate {
                    height: hCurved.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: hCurved.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            width: parent.width / 2
                            text: hapticcurved.rise
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                hapticcurved.setRise(parseFloat(text,10));
                                console.log("Rise is now " + model.value);
                                console.log("Rise in model is now " + hapticcurved.get_rise());
                            }
                            Component.onCompleted: {
                                console.log("Rise value " + model.value + "Backend value Rise " + hapticcurved.get_rise());
                            }
                        }
                    }
                }
            }
            DelegateChoice { roleValue: "Thickness";
                ItemDelegate {
                    height: hCurved.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: hCurved.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            text: hapticcurved.thickness
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                hapticcurved.setThickness(parseFloat(text,10));
                                console.log("Thickness is now " + model.value);
                                console.log("Thickness in model is now " + hapticcurved.get_thickness());
                            }
                            Component.onCompleted: {
                                console.log("Thickness value " + model.value + "Backend value Thickness " + hapticcurved.get_thickness());
                            }
                        }
                    }
                }
            }

        }
        highlight: HighlightDelegate {
            width: parent.width
            anchors {
                left: parent.left
                right: parent.right
            }
        }
        section {
            property: "prop"
            criteria:  ViewSection.FullString
            delegate: SectionDelegate {
                anchors {
                    left: parent.left
                    right: parent.right
                }
                text: section
                onClicked: hCurved.toggleSection(section)
            }
        }

        function isSectionExpanded(section)
        {
            return !(section in collapsed);
        }
        function showSection(section)
        {
            delete collapsed[section];
            collapsedChanged();
        }
        function hideSection(section)
        {
            collapsed[section]=true;
            collapsedChanged();
        }
        function toggleSection(section)
        {
            if(isSectionExpanded(section)) {
                hideSection(section);
            }
            else {
                showSection(section);
            }
        }
        delegate: hapcurveddelegate
        header: hapCHeader
        footer: hapCHeader
        Component {
            id: hapCHeader
            Rectangle {
                width:  parent.width
                height: 25
                Text {
                    text: "Haptic Curved"
                    font.bold: true
                    font.pixelSize: 17
                    fontSizeMode: Text.HorizontalFit
                }
                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        color: "moccasin"
                    }
                    GradientStop {
                        position: 1.00;
                        color: "moccasin"
                    }
                }
            }
        }
    }
}


