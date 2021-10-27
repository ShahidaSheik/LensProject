import QtQuick 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12

ColumnLayout
{
   ListView
   {
    id: view1
    visible: true;
    property var collapsed : ({})
    width: 300
    height: 380
    model: AnteriorSphericalModel {}
    DelegateChooser {
        id: chooser
        role: "front"
        DelegateChoice { roleValue: "Profile Type";
            ItemDelegate {
                Layout.fillWidth: true
                height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: view1.width
                    Text {
                        id: t2
                        clip: true
                        text: model.front
                        font.pixelSize: 15
                        height: implicitHeight
                    }
                    ComboBox {
                        clip: true
                        height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
                        model: ["Spherical", "Toric", "ASpherical"]
                        onActivated: {
                            model.value = editText;
                            anteriorspherical.setProfileType(editText);
                            console.log("Profile Type is now " + model.value);
                            console.log("Profile Type in model is now " + anteriorspherical.get_ProfileType());
                        }
                        Component.onCompleted: {
                            console.log("Profile Type value " + model.value + "Backend value Profile Type " + anteriorspherical.get_ProfileType());
                        }
                    }
                }
            }
        }
        DelegateChoice { roleValue: "Diopter";
            ItemDelegate {
                Layout.fillWidth: true
                height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: view1.width
                    Text {
                        id: t3
                        clip: true
                        text: model.front
                        font.pixelSize: 15
                        height: implicitHeight
                    }
                    TextInput {
                        id: tf1
                        height: implicitHeight
                        text: anteriorspherical.diopter
                        validator: IntValidator{}
                        horizontalAlignment: TextInput.AlignHCenter
                        onAccepted: {
                            model.value = parseInt(text,10);
                            anteriorspherical.setdiopter(parseInt(text,10));
                            console.log("Diopter is now " + model.value + " Backend diopter now " + anteriorspherical.get_diopter());
                        }
                        Component.onCompleted: {
                            console.log("diopter value " + model.value + "Backend value diopter " + anteriorspherical.get_diopter());
                        }
                    }
                }
            }
        }
        DelegateChoice { roleValue: "Fluid Index of Refraction";
            ItemDelegate {
                height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: view1.width
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
                        text: anteriorspherical.FluidIOR
                        onAccepted: {
                            model.value = parseFloat(text,10);
                            anteriorspherical.setFluidIOR(parseFloat(text,10));
                            console.log("Fluid index of refraction is now " + model.value);
                            console.log("Fluid index of refraction in model is now " + anteriorspherical.get_FluidIOR());
                        }
                        Component.onCompleted: {
                            console.log("FIOR value " + model.value + "Backend value FIOR " + anteriorspherical.get_FluidIOR());
                        }
                    }
                }
            }
        }
        DelegateChoice { roleValue: "Material Index of Refraction";
            ItemDelegate {
                height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: view1.width
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
                        text: anteriorspherical.materialIOR
                        onAccepted: {
                            model.value = parseFloat(text,10);
                            anteriorspherical.setmaterialIOR(parseFloat(text,10));
                            console.log("Material index of refraction is now " + model.value);
                            console.log("Material index of refraction in model is now " + anteriorspherical.get_materialIOR());
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
                height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: view1.width
                    CheckDelegate {
                        checkState: anteriorspherical.diopter ? Qt.Checked : Qt.Unchecked
                        nextCheckState: function() {
                            if (checkState === Qt.Checked)
                                return Qt.Unchecked
                            else return Qt.Checked
                        }
                        text: model.front
                        onCheckStateChanged: {
                            model.value = checkState == Qt.Checked ? true : false;
                            console.log("Specify Diopter is now " + model.value);
                            anteriorspherical.setspecifyDiopter(model.value);
                            console.log("Specify Diopter in model is now " + anteriorspherical.get_specifyDiopter());
                        }
                        Component.onCompleted: {
                            console.log("Specify diopter value " + model.value + "Backend value specify diopter " + anteriorspherical.get_specifyDiopter());
                        }
                    }
                }
            }
        }
        DelegateChoice { roleValue: "Lathe Recipe";
            ItemDelegate {
                height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: view1.width
                    Text {
                        clip: true
                        text: model.front
                        font.pixelSize: 15
                         height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
                    }
                    ComboBox {
                        clip: true
                        height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
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
                height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: view1.width
                    CheckDelegate {
                        checkState: anteriorspherical.MeasureSurface ? Qt.Checked : Qt.Unchecked;
                        nextCheckState: function() {
                            if (checkState === Qt.Checked)
                                return Qt.Unchecked
                            else return Qt.Checked
                        }
                        text: model.front
                        onCheckStateChanged: {
                            model.value = checkState == Qt.Checked ? true : false;
                            anteriorspherical.setMeasureSurface(model.value);
                            console.log("Measure Surface is now " + model.value);
                            console.log("Measure Surface in model is now " + anteriorspherical.get_MeasureSurface());
                        }
                        Component.onCompleted: {
                            console.log("Measure Surface value " + model.value + "Backend value Measure surface " + anteriorspherical.get_MeasureSurface());
                        }
                    }
                }
            }
        }
        DelegateChoice { roleValue: "Radius";
            ItemDelegate {
                height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }

                RowLayout {
                    width: view1.width
                    Text {
                        clip: true
                        text: model.front
                        font.pixelSize: 15
                        height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
                    }
                    TextField {
                        clip: true
                        text: anteriorspherical.radius
                        height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
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
            onClicked: view1.toggleSection(section)
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
    header: header1
    Component {
        id: header1
        Rectangle {
            width:  parent.width
            height: 25
            Text {
               text: "Anterior Spherical"
               font.pixelSize: 15
               font.bold: true
               fontSizeMode: Text.HorizontalFit
            }
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: "#98fb98"
                }
                GradientStop {
                    position: 1.00;
                    color: "#98fb98";
                }
            }
        }
    }

}
}
