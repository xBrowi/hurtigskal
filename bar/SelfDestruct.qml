import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Io
import ".."

Rectangle {
    WrapperMouseArea {

        Text {
            text: "dø"
            color: Config.theme.lightText
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