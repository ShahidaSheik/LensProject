import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12
import QtQuick.Controls 1.1
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.3
import QtQuick.Controls.Styles 1.1

ColumnLayout
{
    ListView
    {
        id: view2
        visible: true;
        property var collapsed : ({})
        width: 300
        height: 380
        model: LensPropModel{}
        DelegateChooser {
            id: chooser
            role: "front"
            DelegateChoice { roleValue: "Name";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: view2.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: view2.width
                        Text {
                            id: t2
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            height: implicitHeight
                        }
                        TextInput {
                            id: tf1
                            height: implicitHeight
                            text: mylensmodel.name
                            validator: IntValidator{}
                            horizontalAlignment: TextInput.AlignHCenter
                            onAccepted: {
                                model.value = text;
                                mylensmodel.setname(text);
                                console.log("Name is now " + model.value + " Backend name now " + mylensmodel.get_name());
                            }
                            Component.onCompleted: {
                                console.log("name value " + model.value + "Backend value name " + mylensmodel.get_name());
                            }
                        }
                    }
                }
            }
            DelegateChoice { roleValue: "Precision";
                ItemDelegate {
                    height: view2.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: view2.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            height: implicitHeight
                        }
                        TextField {
                            clip: true
                            height:implicitHeight
                            font.pixelSize: 12
                            text: mylensmodel.precision
                            onAccepted: {
                                model.value = parseInt(text,10);
                                mylensmodel.set_precision(parseInt(text,10));
                                console.log("Precision is now " + model.value);
                                console.log("Precision in model is now " + mylensmodel.get_precision());
                            }
                            Component.onCompleted: {
                                console.log("Precision value " + model.value + "Backend value Precision " + mylensmodel.get_precision());
                            }
                        }
                    }
                }
            }
            DelegateChoice { roleValue: "Blank Diameter";
                ItemDelegate {
                    height: view2.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: view2.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 13
                            height: implicitHeight
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 12
                            height: implicitHeight
                            text: mylensmodel.blankDiameter
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                mylensmodel.set_blankDiam(parseFloat(text,10));
                                console.log("Blank Diameter is now " + model.value);
                                console.log("Blank Diameter in model is now " + mylensmodel.get_blankDiam());
                            }
                            Component.onCompleted: {
                                console.log("Blank Diameter value " + model.value + "Backend value Blank Diameter " + mylensmodel.get_blankDiam());
                            }
                        }
                    }

                }
            }
            DelegateChoice { roleValue: "Lens Diameter";
                ItemDelegate {
                    height: view2.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: view2.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 13
                            height: implicitHeight
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 12
                            height: implicitHeight
                            text: mylensmodel.lensDiameter
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                mylensmodel.set_lensDiam(parseFloat(text,10));
                                console.log("Lens Diameter is now " + model.value);
                                console.log("Lens Diameter in model is now " + mylensmodel.get_lensDiam());
                            }
                            Component.onCompleted: {
                                console.log("Lens Diameter value " + model.value + "Backend value Lens Diameter " + mylensmodel.get_lensDiam());
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
                onClicked: view2.toggleSection(section)
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
        delegate: chooser
        header: header3
        Component {
            id: header3
            Rectangle {
                width:  parent.width
                height: 25
                Text {
                    text: "My Lens"
                    font.bold: true
                    font.pixelSize: 15
                    fontSizeMode: Text.HorizontalFit
                }

                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        color: "orange"
                    }
                    GradientStop {
                        position: 1.00;
                        color: "orange";
                    }
                }
            }
        }

    }
}



