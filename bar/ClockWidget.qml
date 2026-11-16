import Quickshell
import Quickshell.Widgets
import QtQuick

Rectangle {
    color: 'black'
    radius: height/3
    
    implicitWidth: child.implicitWidth * 1.15
    

    Text {
        id: child
        anchors.centerIn: parent
        
        text: Time.time
        color: "white"
        font.pointSize: Math.max(1, parent.height / 2)
    }
}