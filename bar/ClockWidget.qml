import Quickshell
import Quickshell.Widgets
import QtQuick
import ".."

WrapperMouseArea {

    property bool longFormat: false

    Rectangle {

        SystemClock {
            id: clock
            precision: SystemClock.Seconds
        }

        color: Config.theme.primary3
        radius: height/3
        
        implicitWidth: clockText.implicitWidth + height*0.5
        



        Text {
            id: clockText
            anchors.centerIn: parent


            text: longFormat ? Qt.formatDateTime(clock.date, "hh:mm:ss - yyyy-MM-dd") : Qt.formatDateTime(clock.date, "hh:mm")
            color: Config.theme.lightText
            font.pointSize: Math.max(1, parent.height / 2)
        }
    }

    onClicked: mouse => {
            if (mouse.button === Qt.LeftButton) {
                longFormat = !longFormat
            } 
        }
}