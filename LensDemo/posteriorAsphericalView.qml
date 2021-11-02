import QtQuick 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12

ColumnLayout {

    ListModel {
        id: postASpherical
        ListElement { front: "A1"; prop: "Settings"; value: 0 }
        ListElement { front: "A2"; prop: "Settings"; value: 0 }
        ListElement { front: "A3"; prop: "Settings"; value: 0 }
        ListElement { front: "A4"; prop: "Settings"; value: 0 }
        ListElement { front: "Back Length"; prop: "Settings"; value: 0}
        ListElement { front: "basCurvature"; prop: "Settings"; value: 0.1 }
        ListElement { front: "conicConstant"; prop: "Settings"; value: -1 }
        ListElement { front: "Lathe Recipe"; prop: "Settings"; value: "" }
        ListElement { front: "Measure Surface"; prop: "Settings"; value: false }
        ListElement { front: "Radius Curvature"; prop: "Settings"; value: 10 }
        ListElement { front: "Square Edge Step"; prop: "Settings"; value:0}
    }

    ListView
    {
        id: posAsphere
        visible: true
        property var collapsed : ({})
        width: 300
        height: 380
        model: postASpherical
        DelegateChooser {
            id: posteriorASpherical
            role: "front"

            DelegateChoice { roleValue: "A1";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: posAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: posAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 15
                            text: posterioraspheric.A1
                            onAccepted: {
                                model.value = parseInt(text,10);
                                posterioraspheric.setA1(parseInt(text,10));
                                console.log("A1 is now " + model.value);
                                console.log("A1 in model is now " + posterioraspheric.get_A1());
                            }
                            Component.onCompleted: {
                                console.log("A1 value " + model.value + "Backend value A1 " + posterioraspheric.get_A1());
                            }
                        }
                    }
                }
            }
            DelegateChoice { roleValue: "A2";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: posAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: posAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 15
                            text: posterioraspheric.A2
                            onAccepted: {
                                model.value = parseInt(text,10);
                                posterioraspheric.setA2(parseInt(text,10));
                                console.log("A2 is now " + model.value);
                                console.log("A2 in model is now " + posterioraspheric.get_A2());
                            }
                            Component.onCompleted: {
                                console.log("A2 value " + model.value + "Backend value A2 " + posterioraspheric.get_A2());
                            }
                        }
                    }

                }
            }
            DelegateChoice { roleValue: "A3";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: posAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: posAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 15
                            text: posterioraspheric.A3
                            onAccepted: {
                                model.value = parseInt(text,10);
                                posterioraspheric.setA3(parseInt(text,10));
                                console.log("A3 is now " + model.value);
                                console.log("A3 in model is now " + posterioraspheric.get_A3());
                            }
                            Component.onCompleted: {
                                console.log("A3 value " + model.value + "Backend value A3 " + posterioraspheric.get_A3());
                            }
                        }
                    }

                }
            }
            DelegateChoice { roleValue: "A4";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: posAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: posAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 15
                            text: posterioraspheric.A4
                            onAccepted: {
                                model.value = parseInt(text,10);
                                posterioraspheric.setA4(parseInt(text,10));
                                console.log("A4 is now " + model.value);
                                console.log("A4 in model is now " + posterioraspheric.get_A4());
                            }
                            Component.onCompleted: {
                                console.log("A4 value " + model.value + "Backend value A4 " + posterioraspheric.get_A4());
                            }
                        }
                    }

                }
            }
            DelegateChoice { roleValue: "Back Length";
                ItemDelegate {
                    height: posAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: posAsphere.width
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
                            text: posterioraspheric.pabackLength
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseInt(text,10);
                                posterioraspheric.set_pabacklen(parseInt(text,10));
                                console.log("Back Length is now " + model.value + " Backend Back Length now " + posterioraspheric.get_pabacklen());
                            }
                            Component.onCompleted: {
                                console.log("Back Length value " + model.value + "Backend value Back Length " + posterioraspheric.get_pabacklen());
                            }
                        }
                    }
                }
            }

            DelegateChoice { roleValue: "basCurvature";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: posAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: posAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 15
                            text: posterioraspheric.basCurvature
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                posterioraspheric.setbasCurvature(parseFloat(text,10));
                                console.log("Base Curvature is now " + model.value);
                                console.log("Base Curvature in model is now " + posterioraspheric.get_basCurvature());
                            }
                            Component.onCompleted: {
                                console.log("Base Curvature value " + model.value + "Backend value Base Curvature " + posterioraspheric.get_basCurvature());
                            }
                        }
                    }
                }
            }
            DelegateChoice { roleValue: "conicConstant";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: posAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: posAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            font.pixelSize: 15
                            text: posterioraspheric.conicConstant
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                posterioraspheric.setconicConstant(parseFloat(text,10));
                                console.log("conicConstant is now " + model.value);
                                console.log("conicConstant in model is now " + posterioraspheric.get_conicConstant());
                            }
                            Component.onCompleted: {
                                console.log("conicConstant value " + model.value + "Backend value conicConstant " + posterioraspheric.get_conicConstant());
                            }
                        }
                    }

                }
            }
            DelegateChoice { roleValue: "Lathe Recipe";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: posAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: posAsphere.width
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
                                posterioraspheric.setlatheRecipe(editText);
                                console.log("Lathe Recipe is now " + model.value);
                                console.log("Lathe Recipe in model is now " + posterioraspheric.get_latheRecipe());
                            }
                            Component.onCompleted: {
                                console.log("Lathe Recipe value " + model.value + "Backend value lathe recipe " + posterioraspheric.get_latheRecipe());
                            }
                        }
                    }

                }
            }
            DelegateChoice { roleValue: "Measure Surface";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: posAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: posAsphere.width
                        CheckDelegate {
                            checkState: posterioraspheric.MeasureSurface ? Qt.Checked : Qt.Unchecked;
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
                                posterioraspheric.setMeasureSurface(model.value);
                                console.log("Measure Surface is now " + model.value);
                                console.log("Measure Surface in model is now " + posterioraspheric.get_MeasureSurface());
                            }
                            Component.onCompleted: {
                                console.log("Measure Surface value " + model.value + "Backend value Measure surface " + posterioraspheric.get_MeasureSurface());
                            }
                        }
                    }
                }
            }
            DelegateChoice { roleValue: "Radius Curvature";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: posAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }

                    RowLayout {
                        width: posAsphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            text: posterioraspheric.radiusCurvature
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                posterioraspheric.setradiusCurvature(parseFloat(text,10));
                                console.log("Radius of Curvature is now " + model.value);
                                console.log("Radius of Curvature in model is now " + posterioraspheric.get_radiusCurvature());
                            }
                            Component.onCompleted: {
                                console.log("Radius of Curvature value " + model.value + "Backend value Radius of Curvature" + posterioraspheric.get_radiusCurvature());
                            }
                        }
                    }

                }
            }

            DelegateChoice { roleValue: "Square Edge Step";
                ItemDelegate {
                    Layout.fillWidth: true
                    height: posAsphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: posAsphere.width
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
                            text: posterioraspheric.paSqredgeStep
                            leftPadding: 10
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseInt(text,10);
                                posterioraspheric.set_pasqredge(parseInt(text,10));
                                console.log("Square Edge Step is now " + model.value + " Backend Square Edge Step now " + posterioraspheric.get_pasqredge());
                            }
                            Component.onCompleted: {
                                console.log("Square Edge Step value " + model.value + "Backend value Square Edge Step " + posterioraspheric.get_pasqredge());
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
                onClicked: posAsphere.toggleSection(section)
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
        delegate: posteriorASpherical
        header: postHeader
        footer: postHeader
        Component {
            id: postHeader
            Rectangle {
                width:  parent.width
                height: 25
                Text {
                    text: "Posterior ASpherical"
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



