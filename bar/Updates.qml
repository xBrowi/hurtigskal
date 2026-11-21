pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string updateCount

    Process {
        id: updatesProc
        command: ["sh", "-c", "checkupdates | wc -l"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                root.updateCount = this.text.trim()
            }
        }
    }

    Timer {
        interval: 600000
        running: true
        repeat: true
        onTriggered: updatesProc.running = true
    }
}