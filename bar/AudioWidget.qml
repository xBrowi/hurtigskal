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
        
        text: Audio.volume
        color: "white"
        font.pointSize: Math.max(1, parent.height / 2)
    }
}