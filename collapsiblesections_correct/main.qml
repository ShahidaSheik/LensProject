import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qt.labs.qmlmodels 1.0

ApplicationWindow {
    width: 400
    height: 300
    visible: true

    Rectangle {
        width: parent.width
        height: parent.height

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
                expanded: __lv.isSectionExpanded(model.prop)

                MouseArea {
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
        }

    }
}

