import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Rectangle {


    color: 'black'
    radius: height/3
    implicitWidth: layout.implicitWidth * 1.15
    
    
    RowLayout {
        id: layout
        height: parent.height
        spacing: 0

        Text {
            Layout.leftMargin: 8
            text: "battery_android_full"
            color: "white"
            font {
                family: "Material Symbols Rounded"
            }
            font.pointSize: Math.max(1, parent.height / 2)

            
        }

        Text {
            Layout.rightMargin: 8

            text: Battery.percentage + "%"
            //text: "1%"
            color: "white"
            font.pointSize: Math.max(1, parent.height / 2)


            Layout.minimumWidth: font.pointSize*3.5
            horizontalAlignment: Text.AlignRight
        }
    }
    
}