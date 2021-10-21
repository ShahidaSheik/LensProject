import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.12


ApplicationWindow {
    width: 400
    height: 300
    visible: true

    Rectangle {
        width: parent.width
        height: parent.height
        //        Component {
        //            id: nameDelegate
        //            Rectangle {
        //                readonly property ListView __lv : ListView.view
        //                color: __lv.currentIndex == index ? "grey" : "yellow"
        //                implicitHeight: t1.implicitHeight
        //                anchors { left: parent.left ; right: parent.right }
        //                Text {
        //                    id: t1
        //                    text: model.front
        //                    font.pixelSize: 20
        //                    Component.onCompleted: console.log("Welcome",model.index,model.front);
        //                    Component.onDestruction: console.log("Die",model.index,model.front);
        //                }
        //                MouseArea{
        //                    anchors.fill: parent
        //                    onClicked: __lv.currentIndex = index
        //                }
        //            }
        //        }

        ListView
        {
            id: view1
            property var collapsed : ({})
            width: 150
            height: 250

            model: NameModel{}

            DelegateChooser {
                id: chooser
                role: "front"

                DelegateChoice {
                    roleValue: "Profile Type";
                        Rectangle {
                            anchors {
                                left: parent.left ;
                                leftMargin: 2
                                right: parent.right
                                rightMargin: 2
                            }
                            height: lensnames.expanded? implicitHeight : 0
                            Behavior on height {
                                NumberAnimation { duration : 200}
                            }
                            Text
                            {
                                clip: true
                                text: model.front
                                font.pixelSize: 24

                            }
                            ComboBox{
                                clip: true

                                model: ["Spherical", "Toric", "ASpherical"]
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: view1.currentIndex = index
                            }
                            Component.onCompleted: {
                                lensnames.expanded = view1.isSectionExpanded(model.prop)
                            }
                        }
                  }
                DelegateChoice { roleValue: "Diopter";
                         Rectangle {
                            anchors {
                                left: parent.left ;
                                leftMargin: 2
                                right: parent.right
                                rightMargin: 2
                            }
                            height: lensnames.expanded? implicitHeight : 0
                            Behavior on height {
                                NumberAnimation { duration : 200}
                            }
                            Text {
                                clip: true
                                text: model.front
                                font.pixelSize: 24

                            }
                            TextInput {
                                clip: true
                                font.pixelSize: 24

                                text: "1"
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: view1.currentIndex = index
                            }
                        Component.onCompleted: {
                            lensnames.expanded = view1.isSectionExpanded(model.prop)
                        }
                      }
                    }
               DelegateChoice { roleValue: "Fluid Index of Refraction";
                        Rectangle {
                            anchors {
                                left: parent.left ;
                                leftMargin: 2
                                right: parent.right
                                rightMargin: 2
                            }
                            height: lensnames.expanded? implicitHeight : 0
                            Behavior on height {
                                NumberAnimation { duration : 200}
                            }
                            Text {
                                clip: true
                                text: model.front
                                font.pixelSize: 24

                            }
                            TextInput {
                                clip: true
                                font.pixelSize: 24

                                text: "1"
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: view1.currentIndex = index
                            }
                            Component.onCompleted: {
                                lensnames.expanded = view1.isSectionExpanded(model.prop)
                            }
                        }
                }
                DelegateChoice { roleValue: "Material Index of Refraction";
                      Rectangle {
                            anchors {
                                left: parent.left ;
                                leftMargin: 2
                                right: parent.right
                                rightMargin: 2
                            }
                            height: lensnames.expanded? implicitHeight : 0
                            Behavior on height {
                                NumberAnimation { duration : 200}
                            }
                            Text {
                                clip: true
                                text: model.front
                                font.pixelSize: 24

                            }
                            TextInput {
                                clip: true
                                font.pixelSize: 24
                                text: "1"
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: view1.currentIndex = index
                            }
                            Component.onCompleted: {
                                lensnames.expanded = view1.isSectionExpanded(model.prop)
                            }
                        }
                  }
                DelegateChoice { roleValue: "Specify Diopter";
                    Rectangle {
                        anchors {
                            left: parent.left ;
                            leftMargin: 2
                            right: parent.right
                            rightMargin: 2
                        }
                        height: lensnames.expanded? implicitHeight : 0
                        Behavior on height {
                            NumberAnimation { duration : 200}
                        }
                        CheckDelegate {
                            clip: true

                            tristate: true
                            checkState: allChildrenChecked ? Qt.Checked :
                                                             anyChildChecked ? Qt.PartiallyChecked : Qt.Unchecked
                            nextCheckState: function() {
                                if (checkState === Qt.Checked)
                                    return Qt.Unchecked
                                else return Qt.Checked
                            }
                            Text {
                                clip: true
                                text: model.front

                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: view1.currentIndex = index
                        }
                        Component.onCompleted: {
                            lensnames.expanded = view1.isSectionExpanded(model.prop)
                        }
                    }
                }
                DelegateChoice { roleValue: "Lathe Recipe";
                        Rectangle {
                            anchors {
                                left: parent.left ;
                                leftMargin: 2
                                right: parent.right
                                rightMargin: 2
                            }
                            height: lensnames.expanded? implicitHeight : 0
                            Behavior on height {
                                NumberAnimation { duration : 200}
                            }
                            Text
                            {
                                clip: true
                                text: model.front
                                font.pixelSize: 24

                            }
                            ComboBox{
                                clip: true

                                model: ["Spherical", "Toric", "ASpherical"]
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: view1.currentIndex = index
                            }
                            Component.onCompleted: {
                                lensnames.expanded = view1.isSectionExpanded(model.prop)
                            }
                        }
                   }

                 DelegateChoice { roleValue: "Measure Surface";
                    Rectangle {
                        anchors {
                            left: parent.left ;
                            leftMargin: 2
                            right: parent.right
                            rightMargin: 2
                        }
                        height: lensnames.expanded? implicitHeight : 0
                        Behavior on height {
                            NumberAnimation { duration : 200}
                        }

                        CheckDelegate {
                            clip: true
                            tristate: true
                            checkState: allChildrenChecked ? Qt.Checked :
                                                             anyChildChecked ? Qt.PartiallyChecked : Qt.Unchecked
                            nextCheckState: function() {
                                if (checkState === Qt.Checked)
                                    return Qt.Unchecked
                                else return Qt.Checked
                            }
                            Text {
                                clip: true
                                text: model.front
                                font.pixelSize: 24
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: view1.currentIndex = index
                        }
                        Component.onCompleted: {
                            lensnames.expanded = view1.isSectionExpanded(model.prop)
                        }
                    }
                }
                DelegateChoice { roleValue: "Radius";
                       Rectangle {
                            anchors {
                                left: parent.left ;
                                leftMargin: 2
                                right: parent.right
                                rightMargin: 2
                            }
                            height: lensnames.expanded? implicitHeight : 0
                            Behavior on height {
                                NumberAnimation { duration : 200}
                            }

                            Text {
                                clip: true
                                text: model.front
                                font.pixelSize: 24
                            }
                            TextInput {
                                clip: true
                                text: "1"
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: view1.currentIndex = index
                            }
                            Component.onCompleted: {
                                lensnames.expanded = view1.isSectionExpanded(model.prop)
                            }
                        }

                  }
            }

                //            delegate: NameDelegate {
                //                readonly property ListView __lv : ListView.view
                //                anchors {
                //                    left: parent.left ;
                //                    leftMargin: 2
                //                    right: parent.right
                //                    rightMargin: 2
                //                }
                //                expanded: __lv.isSectionExpanded(model.prop)

                //                MouseArea{
                //                    anchors.fill: parent
                //                    onClicked: __lv.currentIndex = index
                //                }
                //            }

            highlight: HighlightDelegate {
                width: parent.width
                anchors {
                    left: parent.left
                    right: parent.right
                }
            }
            //            Component {
            //                id: sectionHeading
            //                Rectangle {
            //                    width: container.width
            //                    height: childrenRect.height
            //                    color: "lightsteelblue"

            //                    Text {
            //                        text: section
            //                        font.bold: true

            //                    }

            //                }

            //            }
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
        }

    }
    NameDelegate {
        id: lensnames
    }
}
