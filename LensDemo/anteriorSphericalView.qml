import QtQuick 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12

ColumnLayout
{
    ListModel {
        id: antSpherical
        ListElement { front: "Diopter"; prop: "Lens Diopter"; value: 1 }
        ListElement { front: "Fluid Index of Refraction"; prop: "Lens Diopter"; value: 1.334 }
        ListElement { front: "Material Index of Refraction"; prop: "Lens Diopter"; value: 1.4914 }
        ListElement { front: "Specify Diopter"; prop: "Lens Diopter"; value: false }
        ListElement { front: "Lathe Recipe"; prop: "Settings"; value: "MyRecipe1" }
        ListElement { front: "Measure Surface"; prop: "Settings"; value: false }
        ListElement { front: "Radius"; prop: "Settings"; value: 7.35 }
    }

    ListView
    {
        id: anSphere
        visible: true;
        property var collapsed : ({})
        width: 300
        height: 380

        model: antSpherical
        DelegateChooser {
            id: anterSphere
            role: "front"

            DelegateChoice { roleValue: "Diopter";
                ItemDelegate {
                    height: anSphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anSphere.width
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
                            text: anteriorspherical.diopter
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseInt(text,10);
                                anteriorspherical.setdiopter(parseInt(text,10));
                                console.log("Diopter is now " + model.value);
                                console.log("Diopter in model is now " + anteriorspherical.get_diopter());
                            }
                            Component.onCompleted: {
                                console.log("Diopter value " + model.value + "Backend value Diopter " + anteriorspherical.get_diopter());
                            }
                        }
                    }
                }
            }
            DelegateChoice { roleValue: "Fluid Index of Refraction";
                ItemDelegate {
                    height: anSphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anSphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            text: anteriorspherical.FluidIOR
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseDouble(text,10);
                                anteriorspherical.setFluidIOR(parseDouble(text,10));
                                console.log("FluidIOR is now " + model.value);
                                console.log("FluidIOR in model is now " + anteriorspherical.get_FluidIOR());
                            }
                            Component.onCompleted: {
                                console.log("FluidIOR value " + model.value + "Backend value FluidIOR " + anteriorspherical.get_FluidIOR());
                            }
                        }
                    }
                }
            }
            DelegateChoice { roleValue: "Material Index of Refraction";
                ItemDelegate {
                    height: anSphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anSphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            text: anteriorspherical.materialIOR
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseDouble(text,10);
                                anteriorspherical.setmaterialIOR(parseDouble(text,10));
                                console.log("MIOR is now " + model.value);
                                console.log("MIOR in model is now " + anteriorspherical.get_materialIOR());
                            }
                            Component.onCompleted: {
                                console.log("MIOR value " + model.value + "Backend value MIOR " + anteriorspherical.get_materialIOR());
                            }
                        }
                    }

                }
            }

            DelegateChoice { roleValue: "Specify Diopter";
                ItemDelegate {
                    height: anSphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anSphere.width
                        CheckDelegate {
                            checkState: anteriorspherical.specifyDiopter ? Qt.Checked : Qt.Unchecked
                            nextCheckState: function() {
                                if (checkState === Qt.Checked)
                                    return Qt.Unchecked
                                else return Qt.Checked
                            }
                            text: model.front
                            leftPadding: 10
                            font.pixelSize: 15
                            onCheckStateChanged: {
                                model.value = checkState == Qt.Checked ? true : false;
                                console.log("Specify Diopter is now " + model.value);
                                anteriorspherical.setspecifyDiopter(checkState);
                                console.log("Specify Diopter in model is now " + anteriorspherical.get_specifyDiopter());
                            }
                            Component.onCompleted: {
                                console.log("Specify Diopter value " + model.value + "Backend value Specify Diopter " + anteriorspherical.get_specifyDiopter());
                            }
                        }
                    }
                }
            }
            DelegateChoice { roleValue: "Lathe Recipe";
                ItemDelegate {
                    height: anSphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anSphere.width
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
                                anteriorspherical.setlatheRecipe(editText);
                                console.log("Lathe Recipe is now " + model.value);
                                console.log("Lathe Recipe in model is now " + anteriorspherical.get_latheRecipe());
                            }
                            Component.onCompleted: {
                                console.log("Lathe Recipe value " + model.value + "Backend value lathe recipe " + anteriorspherical.get_latheRecipe());
                            }
                        }
                    }

                }
            }

            DelegateChoice { roleValue: "Measure Surface";
                ItemDelegate {
                    height: anSphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anSphere.width
                        CheckDelegate {
                            checkState: anteriorspherical.MeasureSurface ? Qt.Checked : Qt.Unchecked
                            nextCheckState: function() {
                                if (checkState === Qt.Checked)
                                    return Qt.Unchecked
                                else return Qt.Checked
                            }
                            text: model.front
                            leftPadding: 10
                            font.pixelSize: 15
                            onCheckStateChanged: {
                                model.value = checkState == Qt.Checked ? true : false;
                                console.log("Measure Surface is now " + model.value);
                                anteriorspherical.setMeasureSurface(checkState);
                                console.log("Measure Surface in model is now " + anteriorspherical.get_MeasureSurface());
                            }
                            Component.onCompleted: {
                                console.log("Measure Surface value " + model.value + "Backend value Measure Surface " + anteriorspherical.get_MeasureSurface());
                            }
                        }
                    }
                }
            }

            DelegateChoice { roleValue: "Radius";
                ItemDelegate {
                    height: anSphere.isSectionExpanded(model.prop)? implicitHeight : 0
                    Behavior on height {
                        NumberAnimation { duration : 200}
                    }
                    RowLayout {
                        width: anSphere.width
                        Text {
                            clip: true
                            text: model.front
                            font.pixelSize: 15
                            leftPadding: 10
                        }
                        TextField {
                            clip: true
                            text: anteriorspherical.radius
                            leftPadding: 10
                            font.pixelSize: 15
                            onAccepted: {
                                model.value = parseFloat(text,10);
                                anteriorspherical.setRadius(parseFloat(text,10));
                                console.log("Radius is now " + model.value);
                                console.log("Radius in model is now " + anteriorspherical.get_Radius());
                            }
                            Component.onCompleted: {
                                console.log("Radius value " + model.value + "Backend value Radius " + anteriorspherical.get_Radius());
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
                onClicked: anSphere.toggleSection(section)
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
        delegate: anterSphere
        header: anterHeader
        footer: anterHeader
        Component {
            id: anterHeader
            Rectangle {
                width:  parent.width
                height: 25
                Text {
                    text: "Anterior Spherical"
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


