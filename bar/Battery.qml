pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Services.UPower

Singleton {
    readonly property bool batteryPowered: UPower.onBattery
    readonly property UPowerDevice battery: UPower.displayDevice 
    readonly property real percentage:  battery && battery.ready ? Math.round(battery.percentage * 100): "N/A"
    readonly property bool charging:    battery && battery.ready ? battery.state === UPowerDeviceState.Charging : false
    readonly property real timeleft:    battery && battery.ready ? battery.timeToEmpty + "s" : "N/A"
    readonly property real iconName:    battery && battery.ready ? battery.iconName : "N/A"
}