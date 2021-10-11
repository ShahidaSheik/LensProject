import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    width: 400
    height: 300
    visible: true
 Rectangle {
     id: container
     width: 200
     height: 250

     ListModel {
         id: anteriorprop
         ListElement { front: "Profile Type"; prop: "Data" }
         ListElement { front: "Diopter"; prop: "Lens Diopter" }
         ListElement { front: "Fluid Index of Refraction"; prop: "Lens Diopter" }
         ListElement { front: "Material Index of Refraction"; prop: "Lens Diopter" }
         ListElement { front: "Specify Diopter"; prop: "Lens Diopter" }
         ListElement { front: "Lathe Recipe"; prop: "Settings" }
         ListElement { front: "Measure Surface"; prop: "Settings" }
         ListElement { front: "Radius"; prop: "Settings" }
     }

     // The delegate for each section header
     Component {
         id: sectionHeading
         Rectangle {
             width: container.width
             height: childrenRect.height
             color: "lightsteelblue"

             Text {
                 text: section
                 font.bold: true
             }
         }
     }

     ListView {
         anchors.fill: parent
         model: anteriorprop
         delegate: Text { text: front }

         section.property: "prop"
         section.criteria: ViewSection.FullString
         section.delegate: sectionHeading
     }
 }
}
