import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import ".."

Rectangle {
    color: 'black'
    radius: height/3
    
    implicitWidth: layout.implicitWidth
    
    RowLayout {
        id: layout
        height: parent.height
        spacing: -height/3
        anchors.fill: parent

        Text {
            id: audioIcon
            Layout.leftMargin: parent.height*0.25
            text: "volume_up"
            color: Config.theme.lightText
            font {
                family: "Material Symbols Rounded"
            }
            font.pointSize: Math.max(1, parent.height * 0.50)
        }

        Text {
            id: audioText
            Layout.rightMargin: parent.height*0.25
            
            
            text: Audio.volume
            color: Config.theme.lightText
            font.pointSize: Math.max(1, parent.height * 0.50)
            Layout.minimumWidth: font.pointSize*3
            horizontalAlignment: Text.AlignRight
        } 
    }
}