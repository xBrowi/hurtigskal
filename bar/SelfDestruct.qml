import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Io
import ".."

Rectangle {
    id: root
    color: Config.theme.primary3
    radius: height/3
    
    implicitWidth: døText.implicitWidth + height*0.5
    WrapperMouseArea {
        anchors.centerIn: root

        Text {
            id: døText
            text: "power_settings_new"
            font {
                family: "Material Symbols Rounded"
            }
            color: Config.theme.lightText
            font.pointSize: Math.max(1, root.height / 2)
        }



        onClicked: mouse => {
            if (mouse.button === Qt.LeftButton) {
                dø.running = true
            } 
        }
    }
    Process {
        id: dø
        command: ["pkexec", "systemctl", "poweroff", "-f"]
        running: false
    }
}