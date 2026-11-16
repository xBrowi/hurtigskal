pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Services.UPower

Singleton {
    readonly property bool batteryPowered: UPower.onBattery
    readonly property UPowerDevice battery: UPower.displayDevice 
    readonly property bool ready: battery && battery.ready
    readonly property real int:  ready ? Math.round(battery.percentage * 100): 0
    readonly property bool charging:    ready ? battery.state === UPowerDeviceState.Charging : false
    readonly property real timeleft:    ready ? battery.timeToEmpty + "s" : "N/A"
    readonly property real iconName:    ready ? battery.iconName : "N/A"
}