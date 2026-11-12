import Quickshell
import QtQuick

Item {
    implicitWidth: child.implicitWidth
    implicitHeight: child.implicitHeight

    Text {
        id: child
            
        text: Time.time
        font.pixelSize: 20

        anchors.verticalCenter: parent.verticalCenter
    }
}