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
                console.log("jegErDød")
            } 
        }
    }
    Process {
        id: dø
        command: ["systemctl", "poweroff"]
        running: false
    }
}