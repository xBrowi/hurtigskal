pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick


Singleton {
    id: root
    //ram shit
    property var swapUsed: 0   //from vmstat
    property var memActive: 0  //from vmstat


    //cpu shit
    property var cpuUsage: 0    //from /stat/proc
    property var cpuLastTotal: 0
    property var cpuLastIdle: 0
    property var cpuTemp: 0    //from sensors

    //gpu shit
    //property var               //from nvidia-smi
    //property var
     
    Process {
        id: vmstatProc
        command: ["sh", "-c", "vmstat -a --no-first | tail -n 1"]   //awk '{print 100 - $15}'
        running: false

        stdout: StdioCollector {
            onStreamFinished: {
                root.cpuIdle = this.text.trim().split()[14]
                root.swapUsed = this.text.trim().split()[2]
                root.memActive = this.text.trim().split()[5]
            }
        }
    }

    Process {
        id: sensorProc
        command: ["sh", "-c", "sensors -u coretemp-isa-0000 | awk '/temp1_input / {print $2}'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                root.cpuTemp = this.text.trim()
            }
        }
    }

    Process {
        id: procStatProc
        command: ["sh", "-c", "cat /proc/stat | awk '/cpu /'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                var times = this.text.trim().split(" ").slice(2).map(Number)  //2 because empty entry
                var totalTime = times.reduce((a, b) => a + b, 0)
                var idleTime = times[3]+times[4]
                
                root.cpuUsage = 1-(idleTime-root.cpuLastIdle)/(totalTime-root.cpuLastTotal)
                
                root.cpuLastIdle = idleTime
                root.cpuLastTotal = totalTime

                console.log(root.cpuUsage)
            }
        }
    }

    Process {
        id: nvidiaProc
        command: ["nvidia-smi blah blah blah"]
        running: false //!!!!!!

        stdout: StdioCollector {
            onStreamFinished: {
                root.cpuIdle = this.text.trim()
            }
        }
    }


    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            procStatProc.running = true
        }
    }
 
}

