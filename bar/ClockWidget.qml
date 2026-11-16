import Quickshell
import Quickshell.Widgets
import QtQuick
import ".."

Rectangle {
    color: 'black'
    radius: height/3
    
    implicitWidth: clockText.implicitWidth + height*0.5
    

    Text {
        id: clockText
        anchors.centerIn: parent


        text: Time.date + " " + Time.time 
        color: Config.theme.lightText
        font.pointSize: Math.max(1, parent.height / 2)
    }
}