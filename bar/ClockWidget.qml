import Quickshell
import Quickshell.Widgets
import QtQuick

Rectangle {
    color: 'black'
    radius: height/3

    height: parent.height
    implicitWidth: child.implicitWidth * 1.15
    

    Text {
        id: child
        anchors.centerIn: parent
        
        text: Time.time
        color: "white"
        font.pointSize: parent.height / 2
    }
}