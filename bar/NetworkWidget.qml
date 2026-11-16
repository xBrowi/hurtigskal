import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Networking
import ".."


Text {
    color: Config.theme.lightText
    text: Network.connectedNetwork.name
}