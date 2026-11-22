import Quickshell
import Quickshell.Widgets
import QtQuick
import ".."

Rectangle {
    color: Config.theme.primary3
    radius: height/3
    
    implicitWidth: updatesText.implicitWidth + height*0.5
    

    Text {
        id: updatesText
        anchors.centerIn: parent


        text: Updates.updateCount + " updates"
        color: Config.theme.lightText
        font.pointSize: Math.max(1, parent.height / 2)
    }
}