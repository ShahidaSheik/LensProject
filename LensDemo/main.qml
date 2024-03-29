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
    height: 1200;
    visible: true;

    property string filepath: " win";
    property string comtype : "D"

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

    toolBar: ToolBar
    {
        id: tlbar;
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: menbar.bottom
        RowLayout {
            ToolButton {
                visible: true
                iconSource: "/icons/similar/newfileicon.png";
                onClicked: {
                    newFile ();
                    win2.visible = true
                    mainLoader.visible = true
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
    Window {
        id: prop;
        width: 315
        x: 1600
        y: 120
        visible: true
        color: "light gray";
        title: "Properties";
        height: mainwindowid.height - (tlbar.height)
        ToolBar{
            id: proptl
            height: 55;
            anchors {
                top: tlbar.bottom
                right: prop.right
                left: prop.left
            }
            RowLayout {
                ToolButton {
                    visible: true
                    id: alphatool
                    iconSource: "/icons/similar/alpha.png";
                    focus: false

                }
                ToolButton {
                    visible: true
                    id: catyegorytool
                    iconSource: "/icons/similar/categorized.png";
                    focus : true
                }
            }
        }
        Loader {
            id: mainLoader
            visible: true
            //x: 1500
            anchors {
                left: prop.left
                right: prop.right
                top: proptl.bottom
            }
            source: "Category.qml"
        }
    }


    Window {
        id: win2;
        width: 300;
        height: mainwindowid.height - tlbar.height
        visible: true;
        x: 9
        y: 120
        color: "gray";
        title: "Navigator";

        TabBar {
            id: bar2
            width: parent.width
            anchors.top: tlbar.bottom
            anchors.left: tlbar.left
            TabButton {
                id: tab1
                text: qsTr("Lens")
                font.pointSize: 10
                width:implicitWidth
            }
            TabButton {
                id: tab2
                text: qsTr("Recipe")
                font.pointSize: 10
                width:implicitWidth
            }
        }
        StackLayout {
            currentIndex: bar2.currentIndex
            anchors.top: bar2.bottom
            anchors.left: parent.left
            anchors.right: bar2.right
            height: parent.height
            TreeView {
                        id: treeView
                        model: lenstree
                        selectionMode: SelectionMode.SingleSelection
                        selection: ItemSelectionModel{
                            id:mySelectionModel
                            model: lenstree
                        }
                        TableViewColumn{
                            role: "name"
                            width: win2.width

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
                                font.pointSize: 10
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    //appWindow.visible = true;
                                    //var ix = lenstree.index(0, 1, styleData.index)
                                   // mySelectionModel.select(ix, ItemSelectionModel.Select)
//                                    console.log("Index obtained " + styleData.index);
//                                    console.log("Data Obtained " + styleData.value);
                                    //appWindow.children.visible = false;
                                    //var component, sprite;
                                    if(styleData.value === "MyLens")
                                    {
                                        mainLoader.source = "Category.qml";
                                    }
                                    else if(styleData.value === "Anterior/Front")
                                    {
                                        mainLoader.source = "AnteriorProp.qml";
                                    }
                                    else if(styleData.value === "Posterior/Back")
                                    {
                                        mainLoader.source = "PosteriorProp.qml";
                                    }
                                    else if(styleData.value === "Haptic")
                                    {
                                        mainLoader.source = "HapticProp.qml";
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
    function expandAll() {
        for(var i=0; i < lenstree.rowCount(); i++) {
            var index = lenstree.index(i,0)
            if(!treeView.isExpanded(index)) {
                treeView.expand(index)
            }
        }
    }

//    Rectangle {
//        id: appWindow
//        x: 800
//        y: 87
//        visible: true
//        width: 400
//        height: 400
//        color: "#afeeee"

//    }
//    Rectangle {
//        id: appWindow2
//        x: 1200
//        y: 87
//        visible: true
//        width: 400
//        height: 400
//        color: "#87cefa"

//    }

//    Rectangle {
//        id: appWindow3
//        visible: true
//        x:1610
//        y:87
//        width: 400
//        height: 400
//        color: "#ffe4b5"
//    }

    function choosedelegate(n){
        console.log("Hello console " + n);
    }

    function navigateopen(){
        win2.visible = true
        mainLoader.visible = true
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
                    anteriorspherical.setProfileType(mymap[prop]);
                else if(prop === "Diopter")
                    anteriorspherical.setdiopter(mymap[prop]);
                textView.text = prop;
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
