import QtQuick 2.12
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12


ColumnLayout
{
    ListModel {
        id: postSphere
        ListElement { front: "Back Length"; prop: "Settings"; value: 0}
        ListElement { front: "Lathe Recipe"; prop: "Settings"; value: "My Recipe1"}
        ListElement { front: "Measure Surface"; prop: "Settings"; value: false }
        ListElement { front: "Radius"; prop: "Settings"; value:20.2 }
        ListElement { front: "Square Edge Step"; prop: "Settings"; value:0}
    }

   ListView
   {
    id: poSphere
    visible: true;
    property var collapsed : ({})
    width: 300
    height: 380
    model: postSphere
    DelegateChooser {
        id: chooser
        role: "front"

        DelegateChoice { roleValue: "Back Length";
            ItemDelegate {
                height: poSphere.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: poSphere.width
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
                        text: posteriorspherical.psbackLength
                        font.pixelSize: 15
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
                height: poSphere.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: poSphere.width
                    Text {
                        clip: true
                        text: model.front
                        font.pixelSize: 15
                        leftPadding: 10
                    }
                    ComboBox {
                        clip: true
                        height: poSphere.isSectionExpanded(model.prop)? implicitHeight : 0
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
                height: poSphere.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: poSphere.width
                    CheckDelegate {
                        checkState: posteriorspherical.MeasureSurface ? Qt.Checked : Qt.Unchecked
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
                height: poSphere.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }

                RowLayout {
                    width: poSphere.width
                    Text {
                        clip: true
                        text: model.front
                        leftPadding: 10
                        font.pixelSize: 15
                    }
                    TextField {
                        clip: true
                        text: posteriorspherical.radius
                        leftPadding: 10
                        font.pixelSize: 15
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
                height: poSphere.isSectionExpanded(model.prop)? implicitHeight : 0
                Behavior on height {
                    NumberAnimation { duration : 200}
                }
                RowLayout {
                    width: poSphere.width
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
                        text: posteriorspherical.psSqredgeStep
                        leftPadding: 10
                        font.pixelSize: 15
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
            onClicked: poSphere.toggleSection(section)
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
    footer: header2
    Component {
        id: header2
        Rectangle {
            width:  parent.width
            height: 25
            Text {
               text: "Posterior Spherical"
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
