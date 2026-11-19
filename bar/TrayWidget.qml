import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Services.SystemTray
import ".."

Rectangle {
    id: root
    color: Config.theme.primary3
    radius: height/3

    implicitWidth: tray.implicitWidth + height * 0.5
    
    RowLayout {
        id: tray
        anchors.centerIn: parent
        spacing: root.height*0.8*0.4

        Repeater {
            model: SystemTray.items
            WrapperMouseArea {
                id: wrapper
                required property var modelData
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                QsMenuAnchor {
                    id: menuAnchor
                    menu: modelData.menu
                    anchor {
                        item: wrapper
                        edges: Edges.Bottom | Edges.Left
                        gravity: Edges.Bottom | Edges.Right
                    }
                }

                onClicked: mouse => {
                    if (mouse.button === Qt.LeftButton) {
                        modelData.activate()
                    } else if (mouse.button === Qt.RightButton) {
                        menuAnchor.open()
                    }
                }




                IconImage {
                    id: icon
                    source: parent.modelData.icon
                    implicitSize: root.height * 0.8
                    anchors.centerIn: parent
                }


            }

            
        }

    }

}