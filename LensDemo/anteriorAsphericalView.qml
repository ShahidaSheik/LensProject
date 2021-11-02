import QtQuick 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12

ColumnLayout {

    ListModel {
        id: anteriorASpherical
        ListElement { front: "A1"; prop: "Settings"; value: 0 }
        ListElement { front: "A2"; prop: "Settings"; value: 0 }
        ListElement { front: "A3"; prop: "Settings"; value: 0 }
        ListElement { front: "A4"; prop: "Settings"; value: 0 }
        ListElement { front: "basCurvature"; prop: "Settings"; value: 0.1 }
        ListElement { front: "conicConstant"; prop: "Settings"; value: -1 }
        ListElement { front: "Lathe Recipe"; prop: "Settings"; value: "" }
        ListElement { front: "Measure Surface"; prop: "Settings"; value: false }
        ListElement { front: "Radius Curvature"; prop: "Settings"; value: 10 }
    }

    ListView
    {
        id: anAsphere
        visible: true
        property var collapsed : ({})
        width: 300
        height: 380
        model: anteriorASpherical
        DelegateChooser {
            id: anterAsphere
            role: "front"

            DelegateChoice { roleValue: "A1";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: anAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 15
                            text: anterioraspheric.A1
                            onAccepted: {
                                model.value = parseInt(text,10);
                                anterioraspheric.setA1(parseInt(text,10));
                                console.log("A1 is now " + model.value);
                                console.log("A1 in model is now " + anterioraspheric.get_A1());
                            }
                            Component.onCompleted: {
                                console.log("A1 value " + model.value + "Backend value A1 " + anterioraspheric.get_A1());
                            }
                        }
//                        SpinBox {
//                            value: model.value
//                            editable: true
//                            contentItem: TextInput {
//                                text: spinbox.textFromValue(spinbox.value, spinbox.locale)
//                                font: spinbox.font
//                                horizontalAlignment: Qt.AlignHCenter
//                                verticalAlignment: Qt.AlignVCenter
//                                readOnly: !spinbox.editable
//                                validator: spinbox.validator
//                                inputMethodHints: Qt.ImhFormattedNumbersOnly
//                                onTextChanged: {
//                                    spinbox.value =  parseInt(text);
//                                }
//                            }
//                        }
                    }
                }
            }
            DelegateChoice { roleValue: "A2";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: anAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 15
                            text: anterioraspheric.A2
                            onAccepted: {
                                model.value = parseInt(text,10);
                                anterioraspheric.setA2(parseInt(text,10));
                                console.log("A2 is now " + model.value);
                                console.log("A2 in model is now " + anterioraspheric.get_A2());
                            }
                            Component.onCompleted: {
                                console.log("A2 value " + model.value + "Backend value A2 " + anterioraspheric.get_A2());
                            }
                        }
                      }

                }
            }
            DelegateChoice { roleValue: "A3";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: anAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 15
                            text: anterioraspheric.A3
                            onAccepted: {
                                model.value = parseInt(text,10);
                                anterioraspheric.setA3(parseInt(text,10));
                                console.log("A3 is now " + model.value);
                                console.log("A3 in model is now " + anterioraspheric.get_A3());
                            }
                            Component.onCompleted: {
                                console.log("A3 value " + model.value + "Backend value A3 " + anterioraspheric.get_A3());
                            }
                        }
                    }

                }
            }
            DelegateChoice { roleValue: "A4";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: anAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 15
                            text: anterioraspheric.A4
                            onAccepted: {
                                model.value = parseInt(text,10);
                                anterioraspheric.setA4(parseInt(text,10));
                                console.log("A4 is now " + model.value);
                                console.log("A4 in model is now " + anterioraspheric.get_A4());
                            }
                            Component.onCompleted: {
                                console.log("A4 value " + model.value + "Backend value A4 " + anterioraspheric.get_A4());
                            }
                        }
                     }

                }
            }
            DelegateChoice { roleValue: "basCurvature";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: anAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 15
                            text: anterioraspheric.basCurvature
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                anterioraspheric.setbasCurvature(parseFloat(text,10));
                                console.log("Base Curvature is now " + model.value);
                                console.log("Base Curvature in model is now " + anterioraspheric.get_basCurvature());
                            }
                            Component.onCompleted: {
                                console.log("Base Curvature value " + model.value + "Backend value Base Curvature " + anterioraspheric.get_basCurvature());
                            }
                        }
                     }
                }
            }
            DelegateChoice { roleValue: "conicConstant";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: anAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 15
                            text: anterioraspheric.conicConstant
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                anterioraspheric.setconicConstant(parseFloat(text,10));
                                console.log("conicConstant is now " + model.value);
                                console.log("conicConstant in model is now " + anterioraspheric.get_conicConstant());
                            }
                            Component.onCompleted: {
                                console.log("conicConstant value " + model.value + "Backend value conicConstant " + anterioraspheric.get_conicConstant());
                            }
                        }
                     }

                }
            }
            DelegateChoice { roleValue: "Lathe Recipe";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: anAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        ComboBox {
                            clip: true
                            model: ["", "New Recipe"]
                            onActivated: {
                                model.value = editText;
                                anterioraspheric.setlatheRecipe(editText);
                                console.log("Lathe Recipe is now " + model.value);
                                console.log("Lathe Recipe in model is now " + anterioraspheric.get_latheRecipe());
                            }
                            Component.onCompleted: {
                                console.log("Lathe Recipe value " + model.value + "Backend value lathe recipe " + anterioraspheric.get_latheRecipe());
                            }
                        }
                    }

                }
            }
            DelegateChoice { roleValue: "Measure Surface";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: anAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anAsphere.width
                        CheckDelegate {
                            checkState: anterioraspheric.MeasureSurface ? Qt.Checked : Qt.Unchecked;
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
                                anterioraspheric.setMeasureSurface(model.value);
                                console.log("Measure Surface is now " + model.value);
                                console.log("Measure Surface in model is now " + anterioraspheric.get_MeasureSurface());
                            }
                            Component.onCompleted: {
                                console.log("Measure Surface value " + model.value + "Backend value Measure surface " + anterioraspheric.get_MeasureSurface());
                            }
                        }
                    }
                }
            }
            DelegateChoice { roleValue: "Radius Curvature";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: anAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }

                    RowLayout {
                        width: anAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            text: anterioraspheric.radiusCurvature
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                anterioraspheric.setradiusCurvature(parseFloat(text,10));
                                console.log("Radius of Curvature is now " + model.value);
                                console.log("Radius of Curvature in model is now " + anterioraspheric.get_radiusCurvature());
                            }
                            Component.onCompleted: {
                                console.log("Radius of Curvature value " + model.value + "Backend value Radius of Curvature" + anterioraspheric.get_radiusCurvature());
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
                onClicked: anAsphere.toggleSection(section)
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
        delegate: anterAsphere
        header:asphericHeader
        footer: asphericHeader
        Component {
            id: asphericHeader
            Rectangle {
                width:  parent.width
                height: 25
                Text {
                    text: "Anterior ASpherical"
                    font.bold: true
                    font.pixelSize: 17
                    fontSizeMode: Text.HorizontalFit
                }
                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        //color: "#98fb98"
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



