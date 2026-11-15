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
    implicitWidth: workspaces.implicitWidth * 1.15


    //text: Hyprland.focusedWorkspace.id

    RowLayout {
        id: workspaces
        anchors.centerIn: parent

        Repeater {
            model: Hyprland.workspaces
            Text {
                required property var modelData
                text: modelData.id

                color: Hyprland.focusedWorkspace.id === modelData.id ? Config.theme.lightText : Config.theme.mediumText

            }
        }


    }

}