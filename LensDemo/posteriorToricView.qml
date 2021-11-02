import QtQuick 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12

ColumnLayout {

    ListModel {
        id: posteriorToric
        ListElement { front: "Back Length"; prop: "Settings"; value: 0}
        ListElement { front: "Lathe Recipe"; prop: "Settings"; value: "MyRecipe1" }
        ListElement { front: "Major Radius"; prop: "Settings"; value: 10 }
        ListElement { front: "Measure Surface"; prop: "Settings"; value: false }
        ListElement { front: "Minor Radius"; prop: "Settings"; value: 15 }
        ListElement { front: "Square Edge Step"; prop: "Settings"; value:0}
    }

    ListView
    {
        id:poToric
        property var collapsed : ({})
        width: 300
        height: 380
        model: posteriorToric
        DelegateChooser {
            id: postoricDelegate
            role: "front"

            DelegateChoice { roleValue: "Back Length";
                ItemDelegate {
                    height: poToric.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: poToric.width
                        Text {
                            id: t3
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            id: tf1
                            height: implicitHeight
                            text: posteriortoric.ptbackLength
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseInt(text,10);
                                posteriortoric.set_ptbacklen(parseInt(text,10));
                                console.log("Back Length is now " + model.value + " Backend Back Length now " + posteriortoric.get_ptbacklen());
                            }
                            Component.onCompleted: {
                                console.log("Back Length value " + model.value + "Backend value Back Length " + posteriortoric.get_ptbacklen());
                            }
                        }
                    }
                }
            }

            DelegateChoice { roleValue: "Lathe Recipe";
                ItemDelegate {
                    height: poToric.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: poToric.width
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
                                posteriortoric.setlatheRecipe(editText);
                                console.log("Lathe Recipe is now " + model.value);
                                console.log("Lathe Recipe in model is now " + posteriortoric.get_latheRecipe());
                            }
                            Component.onCompleted: {
                                console.log("Lathe Recipe value " + model.value + "Backend value lathe recipe " + posteriortoric.get_latheRecipe());
                            }
                        }
                    }

                }
            }

            DelegateChoice { roleValue: "Major Radius";
                ItemDelegate {
                    height: poToric.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }

                    RowLayout {
                        width: poToric.width
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
                                posteriortoric.setmajRadius(parseFloat(text,10));
                                console.log("Radius is now " + model.value);
                                console.log("Radius in model is now " + posteriortoric.get_majRadius());
                            }
                            Component.onCompleted: {
                                console.log("Radius value " + model.value + "Backend value Radius " + posteriortoric.get_majRadius());
                            }
                        }
                    }

                }
            }

            DelegateChoice { roleValue: "Measure Surface";
                ItemDelegate {
                    height: poToric.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: poToric.width
                        CheckDelegate {
                            checkState: posteriortoric.MeasureSurface ? Qt.Checked : Qt.Unchecked;
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
                                posteriortoric.setMeasureSurface(model.value);
                                console.log("Measure Surface is now " + model.value);
                                console.log("Measure Surface in model is now " + posteriortoric.get_MeasureSurface());
                            }
                            Component.onCompleted: {
                                console.log("Measure Surface value " + model.value + "Backend value Measure surface " + posteriortoric.get_MeasureSurface());
                            }
                        }
                    }
                }
            }

            DelegateChoice { roleValue: "Minor Radius";
                ItemDelegate {
                    height: poToric.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }

                    RowLayout {
                        width: poToric.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            text: posteriortoric.minorRadius
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                posteriortoric.setminRadius(parseFloat(text,10));
                                console.log("Minor Radius is now " + model.value);
                                console.log("Minor Radius in model is now " + posteriortoric.get_minRadius());
                            }
                            Component.onCompleted: {
                                console.log("Minor Radius value " + model.value + "Backend value Radius " + posteriortoric.get_minRadius());
                            }
                        }
                    }

                }
            }

            DelegateChoice { roleValue: "Square Edge Step";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: poToric.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: poToric.width
                        Text {
                            id: t4
                            clip: true
                            text: model.front
                            leftPadding: 10
                            font.pixelSize: 15
                        }
                        TextInput {
                            id: tf2
                            height: implicitHeight
                            text: posteriortoric.ptSqredgeStep
                            leftPadding: 10
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseInt(text,10);
                                posteriortoric.set_ptsqredge(parseInt(text,10));
                                console.log("Square Edge Step is now " + model.value + " Backend Square Edge Step now " + posteriortoric.get_ptsqredge());
                            }
                            Component.onCompleted: {
                                console.log("Square Edge Step value " + model.value + "Backend value Square Edge Step " + posteriortoric.get_ptsqredge());
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
                onClicked: poToric.toggleSection(section)
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
        delegate: postoricDelegate
        header: postoricHeader
        footer: postoricHeader
        Component {
            id: postoricHeader
            Rectangle {
                width:  parent.width
                height: 25
                Text {
                    text: "Posterior Toric"
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
