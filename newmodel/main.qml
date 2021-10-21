import QtQuick 2.12
import QtQuick.Window 2.12
import my.data.model 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    DataObjectModel {
            id: _dataObjectModel

            MusicTrack {
                title: "The first track"
                artistName: "John Doe"
                duration: 230213
            }
            MusicTrack {
                title: "The second track"
                artistName: "John Doe"
                duration: 123111
            }
            MusicTrack {
                title: "The third track"
                artistName: "John Doe"
                duration: 12239991
            }
        }

        ListView {
            anchors.fill: parent
            model: _dataObjectModel
            delegate: Item {
                width: ListView.view.width
                height: 40

                Text {
                    anchors.centerIn: parent
                    font.bold: true
                    // NOTE: This is where the roleName comes into play
                    // There is a magic object called "dataObject" that references the
                    // MusicTrack object for this particular index
                    text: dataObject.title + " by " + dataObject.artistName
                }
            }
        }

}
