import QtQuick 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12


ColumnLayout
{
   ListView
   {
    id: view3
    visible: true;
    property var collapsed : ({})
    width: 300
    height: 380
    model: PosteriorSphericalModel {}
    DelegateChooser {
        id: chooser
        role: "front"
        DelegateChoice { roleValue: "Profile Type";
            ItemDelegate {
                Layout.fillWidth: true
                height: view3.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: view3.width
                    Text {
                        id: t2
                        clip: true
                        text: model.front
                        font.pixelSize: 15
                        height: implicitHeight
                    }
                    ComboBox {
                        clip: true
                        height: view3.isSectionExpanded(model.prop)? implicitHeight : 0
                        model: ["Spherical", "Toric", "ASpherical"]
                        onActivated: {
                            model.value = editText;
                            anteriorspherical.setProfileType(editText);
                            console.log("Profile Type is now " + model.value);
                            console.log("Profile Type in model is now " + posteriorspherical.get_ProfileType());
                        }
                        Component.onCompleted: {
                            console.log("Profile Type value " + model.value + "Backend value Profile Type " + posteriorspherical.get_ProfileType());
                        }
                    }
                }
            }
        }
        DelegateChoice { roleValue: "Back Length";
            ItemDelegate {
                Layout.fillWidth: true
                height: view3.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: view3.width
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
                        text: posteriorspherical.psbackLength
                        validator: IntValidator{}
                        horizontalAlignment: TextInput.AlignHCenter
                        onAccepted: {
                            model.value = parseInt(text,10);
                            posteriorspherical.set_psbacklen(parseInt(text,10));
                            console.log("Back Length is now " + model.value + " Backend Back Length now " + posteriorspherical.get_psbacklen());
                        }
                        Component.onCompleted: {
                            console.log("Back Length value " + model.value + "Backend value Back Length " + posteriorspherical.get_psbacklen());
                        }
                    }
                }
            }
        }

        DelegateChoice { roleValue: "Lathe Recipe";
            ItemDelegate {
                height: view3.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: view3.width
                    Text {
                        clip: true
                        text: model.front
                        font.pixelSize: 15
                         height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
                    }
                    ComboBox {
                        clip: true
                        height: view3.isSectionExpanded(model.prop)? implicitHeight : 0
                        model: ["MyRecipe1", "MyRecipe2"]
                        onActivated: {
                            model.value = editText;
                            posteriorspherical.setlatheRecipe(editText);
                            console.log("Lathe Recipe is now " + model.value);
                            console.log("Lathe Recipe in model is now " + posteriorspherical.get_latheRecipe());
                        }
                        Component.onCompleted: {
                            console.log("Lathe Recipe value " + model.value + "Backend value lathe recipe " + posteriorspherical.get_latheRecipe());
                        }
                    }
                }

            }
        }

        DelegateChoice { roleValue: "Measure Surface";
            ItemDelegate {
                height: view3.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: view3.width
                    CheckDelegate {
                        checkState: posteriorspherical.MeasureSurface ? Qt.Checked : Qt.Unchecked
                        nextCheckState: function() {
                            if (checkState === Qt.Checked)
                                return Qt.Unchecked
                            else return Qt.Checked
                        }
                        text: model.front
                        onCheckStateChanged: {
                            model.value = checkState == Qt.Checked ? true : false;
                            console.log("Measure Surface is now " + model.value);
                            posteriorspherical.setMeasureSurface(checkState);
                            console.log("Measure Surface in model is now " + posteriorspherical.get_MeasureSurface());
                        }
                        Component.onCompleted: {
                            console.log("Measure Surface value " + model.value + "Backend value Measure Surface " + posteriorspherical.get_MeasureSurface());
                        }
                    }
                }
            }
        }

        DelegateChoice { roleValue: "Radius";
            ItemDelegate {
                height: view3.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }

                RowLayout {
                    width: view3.width
                    Text {
                        clip: true
                        text: model.front
                        font.pixelSize: 15
                        height: view3.isSectionExpanded(model.prop)? implicitHeight : 0
                    }
                    TextField {
                        clip: true
                        text: posteriorspherical.radius
                        height: view1.isSectionExpanded(model.prop)? implicitHeight : 0
                        onAccepted: {
                            model.value = parseFloat(text,10);
                            posteriorspherical.setRadius(parseFloat(text,10));
                            console.log("Radius is now " + model.value);
                            console.log("Radius in model is now " + posteriorspherical.get_Radius());
                        }
                        Component.onCompleted: {
                            console.log("Radius value " + model.value + "Backend value Radius " + posteriorspherical.get_Radius());
                        }
                    }
                }

            }
        }

        DelegateChoice { roleValue: "Square Edge Step";
            ItemDelegate {
                Layout.fillWidth: true
                height: view3.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: view3.width
                    Text {
                        id: t4
                        clip: true
                        text: model.front
                        font.pixelSize: 15
                        height: implicitHeight
                    }
                    TextInput {
                        id: tf2
                        height: implicitHeight
                        text: posteriorspherical.psSqredgeStep
                        validator: IntValidator{}
                        horizontalAlignment: TextInput.AlignHCenter
                        onAccepted: {
                            model.value = parseInt(text,10);
                            posteriorspherical.set_pssqredge(parseInt(text,10));
                            console.log("Square Edge Step is now " + model.value + " Backend Square Edge Step now " + posteriorspherical.get_pssqredge());
                        }
                        Component.onCompleted: {
                            console.log("Square Edge Step value " + model.value + "Backend value Square Edge Step " + posteriorspherical.get_pssqredge());
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
            onClicked: view3.toggleSection(section)
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
    header: header2
    Component {
        id: header2
        Rectangle {
            width:  parent.width
            height: 25
            Text {
               text: "Posterior Spherical"
               font.bold: true
               font.pixelSize: 15
               fontSizeMode: Text.HorizontalFit
            }
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: "#ffd700"
                }
                GradientStop {
                    position: 1.00;
                    color: "#ffd700"
                }
            }
        }
    }

}
}
