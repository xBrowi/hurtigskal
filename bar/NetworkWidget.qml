import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import ".."

Rectangle {
    color: Config.theme.primary3
    radius: height/3
    
    implicitWidth: networkText.implicitWidth + height*0.5
    

    Text {
        id: networkText
        anchors.centerIn: parent


        text: Network.connectedNetwork ? Network.connectedNetwork.name : "Disconnected"
        color: Config.theme.lightText
        font.pointSize: Math.max(1, parent.height / 2)
    }
}