import Quickshell // for PanelWindow
import QtQuick // for Text
import "../config"



Scope {



    Variants {
        model: Quickshell.screens

        PanelWindow {

            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            color: Colors.color1
            implicitHeight: BarConfig.barHeight
            margins {
                left: BarConfig.margin
                right: BarConfig.margin
                top: BarConfig.margin
            }

            ClockWidget {
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
            }

        }
    }
}
