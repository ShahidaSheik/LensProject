import QtQuick 2.12

ListModel {
    id: names
    ListElement { front: "Profile Type"; prop: "Data"; value: "Spherical" }
    ListElement { front: "Back Length"; prop: "Settings"; value: 0}
    ListElement { front: "Lathe Recipe"; prop: "Settings"; value: "My Recipe1"}
    ListElement { front: "Measure Surface"; prop: "Settings"; value: false }
    ListElement { front: "Radius"; prop: "Settings"; value:20.2 }
    ListElement { front: "Square Edge Step"; prop: "Settings"; value:0}
}

