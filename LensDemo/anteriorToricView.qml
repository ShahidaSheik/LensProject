import QtQuick 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12

ColumnLayout {

    ListModel {
        id: anteriorToric
        ListElement { front: "Lathe Recipe"; prop: "Settings"; value: "MyRecipe1" }
        ListElement { front: "Major Radius"; prop: "Settings"; value: 10 }
        ListElement { front: "Measure Surface"; prop: "Settings"; value: false }
        ListElement { front: "Minor Radius"; prop: "Settings"; value: 15 }
    }

    ListView
    {
        id:anToric
        property var collapsed : ({})
        width: 300
        height: 380
        model: anteriorToric
        DelegateChooser {
            id: toricDelegate
            role: "front"

            DelegateChoice { roleValue: "Lathe Recipe";
                ItemDelegate {
                    height: anToric.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anToric.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        ComboBox {
                            clip: true
                            model: ["MyRecipe1", "MyRecipe2"]
                            onActivated: {
                                model.value = editText;
                                anteriortoric.setlatheRecipe(editText);
                                console.log("Lathe Recipe is now " + model.value);
                                console.log("Lathe Recipe in model is now " + anteriortoric.get_latheRecipe());
                            }
                            Component.onCompleted: {
                                console.log("Lathe Recipe value " + model.value + "Backend value lathe recipe " + anteriortoric.get_latheRecipe());
                            }
                        }
                    }

                }
            }

            DelegateChoice { roleValue: "Major Radius";
                ItemDelegate {
                    height: anToric.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }

                    RowLayout {
                        width: anToric.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            text: anteriortoric.radius

                            onAccepted: {
                                model.value = parseFloat(text,10);
                                anteriortoric.setRadius(parseFloat(text,10));
                                console.log("Radius is now " + model.value);
                                console.log("Radius in model is now " + anteriortoric.get_Radius());
                            }
                            Component.onCompleted: {
                                console.log("Radius value " + model.value + "Backend value Radius " + anteriortoric.get_Radius());
                            }
                        }
                    }

                }
            }

            DelegateChoice { roleValue: "Measure Surface";
                ItemDelegate {
                    height: anToric.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anToric.width
                        CheckDelegate {
                            checkState: anteriortoric.MeasureSurface ? Qt.Checked : Qt.Unchecked;
                            nextCheckState: function() {
                                if (checkState === Qt.Checked)
                                    return Qt.Unchecked
                                else return Qt.Checked
                            }
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                            onCheckStateChanged: {
                                model.value = checkState == Qt.Checked ? true : false;
                                anteriortoric.setMeasureSurface(model.value);
                                console.log("Measure Surface is now " + model.value);
                                console.log("Measure Surface in model is now " + anteriortoric.get_MeasureSurface());
                            }
                            Component.onCompleted: {
                                console.log("Measure Surface value " + model.value + "Backend value Measure surface " + anteriortoric.get_MeasureSurface());
                            }
                        }
                    }
                }
            }

            DelegateChoice { roleValue: "Major Radius";
                ItemDelegate {
                    height: anToric.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }

                    RowLayout {
                        width: anToric.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            text: anteriortoric.radius
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                anteriortoric.setRadius(parseFloat(text,10));
                                console.log("Radius is now " + model.value);
                                console.log("Radius in model is now " + anteriortoric.get_Radius());
                            }
                            Component.onCompleted: {
                                console.log("Radius value " + model.value + "Backend value Radius " + anteriortoric.get_Radius());
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
                onClicked: anToric.toggleSection(section)
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
        delegate: toricDelegate
        header: toricHeader
        footer: toricHeader
        Component {
            id: toricHeader
            Rectangle {
                width:  parent.width
                height: 25
                Text {
                    text: "Anterior Toric"
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
                        color: "moccasin";
                    }
                }
            }
        }
    }
}
