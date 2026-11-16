pragma Singleton

import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Networking
import ".."

Singleton {
    readonly property bool wifiEnabled: Networking.wifiEnabled
    readonly property var devices: Networking.devices 
    readonly property var connectedDevice: devices.values.find(d => d.connected)
    readonly property var networks: connectedDevice ? connectedDevice.networks : null
    
    readonly property var connectedNetwork: networks ? networks.values.find(n => n.connected) : null
}