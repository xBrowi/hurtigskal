import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Io

Rectangle {
    color: 'black'
    radius: height/3

    height: parent.height
    implicitWidth: child.implicitWidth * 1.15


    Text {
        id: child
        anchors.centerIn: parent
        color: "white"

        text: Hyprland.focusedWorkspace.id
    }

    RowLayout {
        id: workspaces

        Repeater {
            model: Hyprland.workspaces
            Text {
                required property var modelData
                text: modelData.id

                color: "white"

            }
        }


    }

}