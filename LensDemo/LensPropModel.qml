import QtQuick 2.12

ListModel {
    id: lens
    ListElement { front: "Name"; prop: "Misc"; value: "MyLens1" }
    ListElement { front: "Precision"; prop: "Misc"; value: 6 }
    ListElement { front: "Blank Diameter"; prop: "Settings"; value: 14.3 }
    ListElement { front: "Lens Diameter"; prop: "Settings"; value: 5.5 }
}
