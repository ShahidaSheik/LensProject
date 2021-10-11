import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.15
import QtQml.Models 2.11
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.4
import com.mytexteditor.filerwritter 1.0


ApplicationWindow {
    id: mainwindowid
    title: qsTr ("LensPro Designer Demo");
    width: 2000;
    height: 1300;
    visible: true;
    property string filepath: " win";
    property real diameter: 10.5;
    property string lensType : "Toric"
    property real blankDiam : 12.0
    property string front : "NO"
    property real lensDiam : 5.5000
    property real hapticDiam : 12.0000
    property real hapticThickness : 0.1700
    property real hapticRise : 0.2843
    property real hapticRadius : 18.7000
    property string measureSurface : "TRUE"
    property real backLength : 10.67
    property real majorRadius : 70.0000
    property real minorRadius : 150.0000
    property string mill : "YES"
    property string recipeName : "MyRecipe1"
    property int numberPasses : 2
    property string comtype : "D"

    toolBar: ToolBar
    {
        id: tlbar;
        RowLayout {
            ToolButton {
                visible: true
                iconSource: "/icons/similar/newfileicon.png";
                onClicked: {
                    newFile ();
                    win2.visible = true
                    prop2.visible = true
                }
            }
            ToolButton {
                visible: true
                iconSource: "/icons/similar/File-Open-icon.png";
                onClicked: openfileDialog.open ();
            }
            ToolButton {
                visible: true
                iconSource: "/icons/similar/fileClose.jpg";
                onClicked: closetextfile();
            }
            ToolButton {
                visible: true
                iconSource: "/icons/similar/save.jpg";
                onClicked: saveFile ();
            }
            ToolButton {
                visible: true
                iconSource: "/icons/similar/saveasicon.png";
                onClicked: fileSaveAsDialog.open();
            }
            ToolSeparator{}
            ToolButton {
                visible: true
                iconSource: "/icons/similar/newfileicon.png";
                onClicked: newFile ();
            }
            ToolButton {
                visible: true
                iconSource: "/icons/similar/File-Open-icon.png";
                onClicked: openfileDialog.open ();
            }
            ToolButton {
                visible: true
                iconSource: "/icons/similar/save.jpg";
                onClicked: saveFile();
            }
            ToolButton {
                visible: true
                iconSource: "/icons/similar/saveasicon.png";
                onClicked: fileSaveAsDialog.open();
            }
            ToolSeparator{}
            ToolButton {
                visible: true
                iconSource: "/icons/similar/export-icon.png";
                onClicked: openfileDialog.open ();
            }
            ToolSeparator{}
            ToolButton {
                visible: true
                iconSource: "/icons/similar/Undo.png";
                // onClicked:
            }
            ToolButton {
                visible: true
                iconSource: "/icons/similar/Redo-icon.png";
                //   onClicked:
            }
        }
    }
    menuBar:
        MenuBar {
        id: menbar
        Menu {
            title: qsTr ("& File");
            MenuItem {
                text: qsTr ("New Lens");
                shortcut: "Ctrl + N";
                iconSource: "/icons/similar/newfileicon.png";
                onTriggered: {
                    newFile ();
                    navigateopen();
                }

            }
            MenuItem {
                text: qsTr ("Open Lens");
                shortcut: "Ctrl + O";
                iconSource: "/icons/similar/File-Open-icon.png";
                onTriggered: {
                    openfileDialog.open ();
                }

            }
            MenuItem {
                text: qsTr ("Close Lens");
                shortcut: "Ctrl + W";
                iconSource: "/icons/similar/fileClose.jpg";
                onTriggered: closetextfile();
            }
            MenuItem {
                text: qsTr ("Save Lens");
                shortcut: "Ctrl + S";
                iconSource: "/icons/similar/save.jpg";
                onTriggered: saveFile ();
            }
            MenuItem {
                text: qsTr ("Save As");
                shortcut: "Ctrl + A";
                iconSource: "/icons/similar/saveasicon.png";
                onTriggered: fileSaveAsDialog.open();
            }
            MenuSeparator {}
            Menu {
                title: "Export";
                iconSource: "/icons/similar/export-icon.png";
                MenuItem {
                    text: "To A32100 Program File";
                }
            }
            MenuSeparator {}
            MenuItem {
                text: qsTr ("Exit");
                shortcut: "Ctrl + Q";
                iconSource: "/icons/similar/Windows-Close-Program-icon.png";
                onTriggered: Qt.quit ();
            }
        }

        Menu {
            title: qsTr ("& Recipe");
            MenuItem {
                text: qsTr ("New Recipe");
                shortcut: "Ctrl + N";
                iconSource: "/icons/similar/newrecipe.jpg";
                onTriggered: newFile ();

            }
            MenuItem {
                text: qsTr ("Save Recipe");
                shortcut: "Ctrl + S";
                iconSource: "/icons/similar/save.jpg";
                onTriggered: saveFile ();
            }
            MenuItem {
                text: qsTr ("Save Recipe As");
                shortcut: "Ctrl + A";
                iconSource: "/icons/similar/saveasicon.png";
                onTriggered: fileSaveAsDialog.open();
            }
        }
        Menu {
            title: qsTr ("& Edit");
            MenuItem {
                text: qsTr ("Undo");
                shortcut: "Ctrl + Z";
                iconSource: "/icons/similar/Undo.png";
                //onTriggered:

            }
            MenuItem {
                text: qsTr ("Redo");
                shortcut: "Ctrl + Z";
                iconSource: "/icons/similar/Redo-icon.png";
                //onTriggered:

            }
            MenuSeparator {}
            MenuItem {
                text: qsTr ("Delete");
                shortcut: "Del";
                iconSource: "/icons/similar/File-Delete-icon.png";
                //onTriggered:
            }
        }
        Menu {
            title: qsTr ("& View");
            MenuItem {
                id: navigate;
                text: qsTr ("Navigation");
                onTriggered: navigateopen ();
            }
            MenuItem {
                id: properties;
                text: qsTr ("Properties");
                //  onTriggered:
            }
            MenuItem {
                id: dimensions;
                text: qsTr ("Dimensions");
                //   onTriggered:
            }
        }
        Menu {
            title: qsTr ("& Tools");
            MenuItem {
                id: tools;
                iconSource: "/icons/similar/prefs-icon.png";
                text: qsTr ("Preferences");
                //onTriggered:
            }
        }
        Menu {
            title: qsTr ("& Help");
            MenuItem {
                text: qsTr ("Help");
                iconSource: "/icons/similar/Categories-system-help-icon.png";
                //onTriggered:
            }
            MenuItem {
                text: qsTr ("About");
                iconSource: "/icons/similar/about.png";
                onTriggered: aboutapp ();
            }
        }
    }

    Window {
        id: prop2;
        width: 300;
        height: 915;
        visible: false;
        x: 1620;
        y: 120
        color: "light gray";
        title: "Properties";
        ToolBar{
            id: proptlbar;
            RowLayout {
                ToolButton {
                    visible: true
                    id: alphatool
                    iconSource: "/icons/similar/alpha.png";
                    focus: true
                    StackLayout {
                        width: parent.width
                        currentIndex: alphatool.currentIndex
                        anchors.top: alphatool.bottom
                        anchors.left: proptlbar.left
                        Item {
                            id: alphaitem
                            ColumnLayout {
                                TreeView {
                                    id: treeViewprop
                                    width: proptlbar.width
                                    anchors.right: proptlbar.right

                                    model: lensmodel
                                    selection: ItemSelectionModel{
                                        id: anteriorModel
                                        model: lensmodel
                                        onCurrentIndexChanged:{ }
                                    }
                                    itemDelegate: ItemDelegate {
                                        MouseArea{
                                            onClicked: {
                                                treeViewprop.selection.setCurrentIndex(styleData.index, ItemSelectionModel.NoUpdate);
                                                treeViewprop.selection.select(styleData.index, ItemSelectionModel.ClearAndSelect);
                                                treeViewprop.selection.setCurrentIndex(styleData.index,ItemSelectionModel.SelectCurrent);
                                            }
                                        }
                                        Text{
                                            text: styleData.value !== undefined ? styleData.value : ""
                                            Component.onCompleted: {
                                                var n = styleData.value;
                                                console.log("Name " + n);
                                                if(n=="Name"){
                                                    comtype = "MyLens";
                                                    console.log("Passed Successfully from name " + comtype);
                                                }
                                            }
                                        }
                                    }
                                    TableViewColumn{
                                        //title:"Name"
                                        role: "name"
                                        width: 150
//                                      delegate: Item {
//                                            Component.onCompleted: {
//                                                var n = styleData.value;
//                                                console.log(n);
//                                            }
//                                      }
                                    }
                                    TableViewColumn{
                                        //title:"Value"
                                        role: "value"
                                        width: 80
                                        delegate: Item {

                                            TextInput{
                                                text: styleData.value !== undefined ? styleData.value :""
                                                selectByMouse: true
                                                onAccepted: {
                                                    lensmodel.setValue(styleData.index, Number(text));
                                                    focus = true;
                                                    var p = lensmodel.getValue(styleData.index);
                                                    console.log(p);
                                                }
                                            }
                                            Component.onCompleted: {
                                                var n = styleData.value;
                                                console.log("Value " + n);
                                                if(comtype == "MyLens")
                                                    console.log("Passed Successfully");
                                            }
                                        }
                                    }
                                    Component.onCompleted:
                                    {
                                        expandAllprop();
                                    }

                                }
                            }
                        }

                    }
                }
                ToolButton {
                    visible: true
                    id: catyegorytool
                    iconSource: "/icons/similar/categorized.png";
                    focus : false
                }
            }
        }
    }

    function expandAllprop() {
        for(var i=0; i < lensmodel.rowCount(); i++) {
            var index = lensmodel.index(i,0)
            if(!treeViewprop.isExpanded(index)) {
                treeViewprop.expand(index)
            }
        }
    }
    function expandAll() {
        for(var i=0; i < lenstree.rowCount(); i++) {
            var index = lenstree.index(i,0)
            if(!treeView.isExpanded(index)) {
                treeView.expand(index)
            }
        }
    }

    Window {
        id: win2;
        width: 300;
        height: 915
        visible: false;
        x: 8;
        y: 120
        color: "light gray";
        title: "Navigator";
        TabBar {
            id: bar2
            width: parent.width
            TabButton {
                id: tab1
                text: qsTr("Lens")
            }
            TabButton {
                id: tab2
                text: qsTr("Recipe")
            }
        }
        StackLayout {
            currentIndex: bar2.currentIndex
            anchors.top: bar2.bottom
            Item {
                id: lensTab
                ColumnLayout {
                    TreeView {
                        id: treeView
                        anchors.right: proptlbar.right
                        model: lenstree
                        selectionMode: SelectionMode.SingleSelection
                        selection: ItemSelectionModel{
                            id:mySelectionModel
                            model: lenstree
                        }
                        TableViewColumn{
                            role: "name"
                            width: win2.width
//                            delegate: {
//                                   var n = styleData.value;
//                                   choosedelegate(n);
//                            }
                        }
                        Component.onCompleted: {
                            expandAll();
                            var ix1 = lenstree.index(0, 0, treeView.rootIndex)
                            var ix = lenstree.index(0, 0, ix1)
                            mySelectionModel.select(ix, ItemSelectionModel.Select)

                        }
                        itemDelegate: Item {
                                Text {
                                anchors.fill: parent
                                color: styleData.textColor
                                elide: styleData.elideMode
                                text: styleData.value
                                }
                            }


                        onClicked: {
                            lens.visible = true;
                            prop.visible = true;
                            appWindow.visible = true;
                            if (index.parent.row >= 0) {
                                if (index.row >= 0) {
                                    console.log("data selected: " + lenstree.data(index));
                                    var newQML = "import QtQuick 2.0; \n";
                                    newQML += "import QtQuick.Controls 2.0\n";
                                    newQML += "ComboBox {\n";
                                    newQML += "  model: ListModel {\n"
                                    newQML += "    ListElement {\n"
                                    newQML += "      name: \"One\"\n"
                                    newQML += "    }\n"
                                    newQML += "    ListElement {\n"
                                    newQML += "      name: \"Two\"\n"
                                    newQML += "    }\n"
                                    newQML += "  }\n"
                                    newQML += "}\n"

                                    var new2qml = "import QtQuick 2.0; \n";
                                    new2qml += "import QtQuick.Controls 2.0\n";
                                    new2qml += "ComboBox {\n";
                                    new2qml += "model: [\"First\", \"Second\", \"Third\"]";
                                    new2qml += "}\n"
                                }
                                //var newObject = Qt.createQmlObject('import QtQuick 2.0; Text { text: "sample" }', prop, "sample");
                                var newObject = Qt.createQmlObject(newQML, lens, "combo1");
                                var new2Obj = Qt.createQmlObject(new2qml, prop, "combo2");
                                var lenstype = "ASPHERIC"
                                var component = Qt.createComponent("AnteriorProp.qml");
                                var sprite = component.createObject(appWindow, {x: 300, y: 150});
                                if (sprite === null) {
                                       // Error Handling
                                       console.log("Error creating object");
                                   }
                                }
                            }
                        }
                    }
                }
            }
            Item {
                id: recipeTab
            }
    }
    Rectangle {
        id: lens
        x: 370
        y: 40
        visible: false
        width: 200
        height: 50
        color: "#DDDDDD"
    }

    Rectangle {
        id: prop
        x: 630
        y: 40
        visible: false
        width: 200
        height: 150
        color: "#DDDDEE"
    }
    Rectangle {
        id: appWindow
        x: 500
        y: 200
        visible: false
        width: 200
        height: 50
        color: "#DDDDEE"
    }

    function choosedelegate(n){
        console.log(n);
    }

    function navigateopen(){
        win2.visible = (win2.visible == true ? 0 : 1)
        prop2.visible = (prop2.visible == true ? 0: 1)
    }

    function aboutapp ()
    {
        aboutappdialog.visible = true;
    }
    function newFile ()
    {
        mainwindowid.filepath = "";
        // Code for displaying the field values in the various text boxes and locations from the default values in the localstore
    }

    function saveFile ()
    {
        if (mainwindowid.filepath.length === 0)
        {
            fileDialog.open ();
        }
        else
        {
            filerwritterid.setFileName(mainwindowid.filepath);
            filerwritterid.saveFile ("Save Params");
        }
    }

    function closetextfile()
    {
        filerwritterid.closeFile();
    }

    FileDialog {
        id: openfileDialog
        title: "Select File"
        selectExisting: true;
        nameFilters: ["files (* .txt)", "All files (*)"]

        onAccepted: {
            var filename = openfileDialog.fileUrl;
            filerwritterid.setFileName(filename);
            filerwritterid.readFile ();
            mainwindowid.filepath = filename;
            textView.text = "";
            var mymap = filerwritterid.get_map();
            for (var prop in mymap) {
                console.log("Object item:", prop, "=", mymap[prop])
                if( prop === "LensType")
                    lensType = mymap[prop]
                else if(prop === "BackLength")
                    backLength = mymap[prop]
                textView.text += prop;
                textView.text += mymap[prop];
            }
            console.log(" LensType = ", lensType, "BackLength = ", backLength);
        }
    }
    Text {
        id: textView
        color: "Green"
        clip: true
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.verticalCenter
            margins: 5
        }
    }
    FileDialog {
        id: fileDialog
        title: "Choose Save Path"
        selectExisting: false;
        nameFilters: ["files (* .txt)", "All files (*)"]
        onAccepted: {
            var filename = fileDialog.fileUrl;
            filerwritterid.setFileName(filename);
            filerwritterid.saveFile ("Save Text");
            mainwindowid.filepath = filename;
        }
    }
    FileDialog {
        id: fileSaveAsDialog
        title: "Choose SaveAs Path"
        selectExisting: false;
        nameFilters: ["files (* .txt)", "All files (*)"]
        onAccepted: {
            var filename = fileSaveAsDialog.fileUrl;
            filerwritterid.setFileName(filename);
            filerwritterid.saveFile ("SaveAs Text");
            mainwindowid.filepath = filename;
        }
    }
    MessageDialog {
        id: aboutappdialog
        title: "About the sSoftware"
        text: "This software is used to design the lens given its various dimentions"
    }
    FileRWritter
    {
        id: filerwritterid;
        m_fileName: "";
    }
}
