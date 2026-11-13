pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string time
    property string date
    property string weekday

    Process {
        id: dateProc
        command: ["date", "+%H:%M:%S  %d/%m"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.time = this.text.trim()
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}