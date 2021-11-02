import QtQuick 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12

ColumnLayout
{
    ListModel {
        id: hapflat
        ListElement { front: "Diameter"; prop: "Settings"; value: 12 }
        ListElement { front: "Thickness"; prop: "Settings"; value: 0.17 }
    }

    ListView
    {
        id: hFlat
        //visible: true;
        property var collapsed : ({})
        width: 300
        height: 380

        model: hapflat
        DelegateChooser {
            id: hapflatdelegate
            role: "front"

            DelegateChoice { roleValue: "Diameter";
                ItemDelegate {
                    height: hFlat.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: hFlat.width
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
                            text: hapticflat.diameter
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseInt(text,10);
                                hapticflat.setDiameter(parseInt(text,10));
                                console.log("Diameter is now " + model.value);
                                console.log("Diameter in model is now " + hapticflat.get_diameter());
                            }
                            Component.onCompleted: {
                                console.log("Diameter value " + model.value + "Backend value Diameter " + hapticflat.get_diameter());
                            }
                        }
                    }
                }
            }
            DelegateChoice { roleValue: "Thickness";
                ItemDelegate {
                    height: hFlat.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: hFlat.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            text: hapticflat.thickness
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                hapticflat.setThickness(parseFloat(text,10));
                                console.log("Thickness is now " + model.value);
                                console.log("Thickness in model is now " + hapticflat.get_thickness());
                            }
                            Component.onCompleted: {
                                console.log("Thickness value " + model.value + "Backend value Thickness " + hapticflat.get_thickness());
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
                onClicked: hFlat.toggleSection(section)
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
        delegate: hapflatdelegate
        header: hapFHeader
        footer: hapFHeader
        Component {
            id: hapFHeader
            Rectangle {
                width:  parent.width
                height: 25
                Text {
                    text: "Haptic Flat"
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
