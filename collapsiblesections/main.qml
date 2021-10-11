import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

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
            focus: true
            clip: true

            model: NameModel{}
            delegate: NameDelegate {
                readonly property ListView __lv : ListView.view
                anchors {
                    left: parent.left ;
                    leftMargin: 2
                    right: parent.right
                    rightMargin: 2
                }
                expanded: __lv.isSectionExpanded(model.prop)

                MouseArea{
                    anchors.fill: parent
                    onClicked: __lv.currentIndex = index
                }
            }
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
}

