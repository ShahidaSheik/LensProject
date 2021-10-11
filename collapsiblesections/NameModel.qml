import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ListModel {
    id: names
    ListElement { front: "Profile Type"; prop: "Data" }
    ListElement { front: "Diopter"; prop: "Lens Diopter" }
    ListElement { front: "Fluid Index of Refraction"; prop: "Lens Diopter" }
    ListElement { front: "Material Index of Refraction"; prop: "Lens Diopter" }
    ListElement { front: "Specify Diopter"; prop: "Lens Diopter" }
    ListElement { front: "Lathe Recipe"; prop: "Settings" }
    ListElement { front: "Measure Surface"; prop: "Settings" }
    ListElement { front: "Radius"; prop: "Settings" }
}
