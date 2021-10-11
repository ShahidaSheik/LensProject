import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ListModel {
    id: names
    ListElement { front: "Profile Type"; value: "Spehrical"; prop: "Data" }
    ListElement { front: "Diopter"; value: "1"; prop: "Lens Diopter" }
    ListElement { front: "Fluid Index of Refraction"; value: "1.334"; prop: "Lens Diopter" }
    ListElement { front: "Material Index of Refraction"; value: "1.4914"; prop: "Lens Diopter" }
    ListElement { front: "Specify Diopter"; value: "1"; prop: "Lens Diopter" }
    ListElement { front: "Lathe Recipe"; value: "Recipe1"; prop: "Settings" }
    ListElement { front: "Measure Surface"; value: "1"; prop: "Settings" }
    ListElement { front: "Radius"; value: "7.34"; prop: "Settings" }
}
