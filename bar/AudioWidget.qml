import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import ".."

Rectangle {
    color: Config.theme.primary3
    radius: height/3
    
    implicitWidth: layout.implicitWidth + height * 0.5
    
    RowLayout {
        id: layout
        height: parent.height
        spacing: -height/3
        anchors.centerIn: parent

        Text {
            id: audioIcon
            text: "volume_up"
            color: Config.theme.lightText
            font {
                family: "Material Symbols Rounded"
            }
            font.pointSize: Math.max(1, parent.height * 0.50)
        }

        Text {
            id: audioText
            
            
            text: Audio.volume
            //text: "100"
            color: Config.theme.lightText
            font.pointSize: Math.max(1, parent.height * 0.50)
            Layout.minimumWidth: font.pointSize*3
            horizontalAlignment: Text.AlignRight
        } 
    }
}