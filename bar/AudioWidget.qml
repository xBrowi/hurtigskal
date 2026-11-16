import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Rectangle {
    color: 'black'
    radius: height/3
    
    implicitWidth: layout.implicitWidth
    
    RowLayout {
        id: layout
        height: parent.height
        spacing: 0
        anchors.fill: parent

        Text {
            id: audioIcon
            Layout.leftMargin: 8
            text: "volume_up"
            color: "white"
            font {
                family: "Material Symbols Rounded"
            }
            font.pointSize: Math.max(1, parent.height / 2)
        }

        Text {
            id: audioText
            Layout.rightMargin: 8
            
            
            text: Audio.volume
            color: "white"
            font.pointSize: Math.max(1, parent.height / 2)
            Layout.minimumWidth: font.pointSize*3
            horizontalAlignment: Text.AlignRight
        } 
    }
}