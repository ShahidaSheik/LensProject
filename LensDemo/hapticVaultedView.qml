import QtQuick 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12

ColumnLayout
{
    ListModel {
        id: hapVault
        ListElement { front: "Diameter"; prop: "Settings"; value: 12 }
        ListElement { front: "Rise"; prop: "Settings"; value: 0.25 }
        ListElement { front: "Thickness"; prop: "Settings"; value: 0.17 }
    }

    ListView
    {
        id: hVault
        visible: true;
        property var collapsed : ({})
        width: 300
        height: 380

        model: hapVault
        DelegateChooser {
            id: hapvaultdelegate
            role: "front"

            DelegateChoice { roleValue: "Diameter";
                ItemDelegate {
                    height: hVault.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: hVault.width
                        Text {
                            id: t1
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            width: parent.width / 2
                            text: hapticvaulted.diameter
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseInt(text,10);
                                hapticvaulted.setDiameter(parseInt(text,10));
                                console.log("Diameter is now " + model.value);
                                console.log("Diameter in model is now " + hapticvaulted.get_diameter());
                            }
                            Component.onCompleted: {
                                console.log("Diopter value " + model.value + "Backend value Diopter " + hapticvaulted.get_diameter());
                            }
                        }
                    }
                }
            }

            DelegateChoice { roleValue: "Rise";
                ItemDelegate {
                    height: hVault.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: hVault.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            width: parent.width / 2
                            text: hapticvaulted.rise
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                hapticvaulted.setRise(parseFloat(text,10));
                                console.log("Rise is now " + model.value);
                                console.log("Rise in model is now " + hapticvaulted.get_rise());
                            }
                            Component.onCompleted: {
                                console.log("Rise value " + model.value + "Backend value Rise " + hapticvaulted.get_rise());
                            }
                        }
                    }
                }
            }
            DelegateChoice { roleValue: "Thickness";
                ItemDelegate {
                    height: hVault.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: hVault.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            text: hapticvaulted.thickness
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                hapticvaulted.setThickness(parseFloat(text,10));
                                console.log("Thickness is now " + model.value);
                                console.log("Thickness in model is now " + hapticvaulted.get_thickness());
                            }
                            Component.onCompleted: {
                                console.log("Thickness value " + model.value + "Backend value Thickness " + hapticvaulted.get_thickness());
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
                onClicked: hVault.toggleSection(section)
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
        delegate: hapvaultdelegate
        header: hapVHeader
        footer: hapVHeader
        Component {
            id: hapVHeader
            Rectangle {
                width:  parent.width
                height: 25
                Text {
                    text: "Haptic Vaulted"
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

