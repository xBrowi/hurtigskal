import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import ".."

Rectangle {


    color: Config.theme.primary3
    radius: height/3
    implicitWidth: layout.implicitWidth
    
    
    RowLayout {
        id: layout
        height: parent.height
        spacing: 5

        Text {
            Layout.leftMargin: 8
            property int icon_id: Math.round(Battery.percentage*(7/100))
             
            text: Battery.charging ? "battery_android_frame_bolt" : (icon_id == 7 ? "battery_android_frame_full" : "battery_android_frame_" + icon_id)
            color: Config.theme.lightText
            font {
                family: "Material Symbols Rounded"
            }
            font.pointSize: Math.max(1, parent.height / 2)

            
        }

        Text {
            Layout.rightMargin: 8

            text: Battery.percentage + "%"
            //text: "100%"
            color: Config.theme.lightText
            font.pointSize: Math.max(1, parent.height / 2)


            Layout.minimumWidth: font.pointSize*3.8
            horizontalAlignment: Text.AlignRight
        }
    }
    
}