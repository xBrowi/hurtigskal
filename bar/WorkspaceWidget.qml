import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Io
import ".."

Rectangle {
    color: Config.theme.primary3
    radius: height/3

    implicitWidth: workspaces.implicitWidth + height*0.5
    
    RowLayout {
        id: workspaces
        anchors.centerIn: parent

        Repeater {
            model: Hyprland.workspaces

            Rectangle {
                id: rect
                required property var modelData
                color: Hyprland.focusedWorkspace.id === rect.modelData.id ? Config.theme.primary2 : "transparent"
                radius: height/2
                implicitHeight:parent.parent.height*0.85
                implicitWidth: height

                Text {
                    id:workspaceText
                    anchors.centerIn: parent
                    text: rect.modelData.id
                    font.pointSize: Math.max(1,parent.height/2)
                    horizontalAlignment: Text.AlignHCenter
                    color: Hyprland.focusedWorkspace.id === rect.modelData.id ? Config.theme.lightText : Config.theme.mediumText
                }
            }
        }

    }

}