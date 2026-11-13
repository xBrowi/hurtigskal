import Quickshell // for PanelWindow
import QtQuick // for Text
import QtQuick.Layouts
import Quickshell.Wayland
import "../config"



Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: root

            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            color: Colors.transparentish
            implicitHeight: BarConfig.barHeight
            BackgroundEffect.blurRegion: Region { item: root.contentItem }
            margins {
                left: BarConfig.margin
                right: BarConfig.margin
                top: BarConfig.margin
            }




            RowLayout {
                id: leftLayout
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }

                Text {
                    text: "left"
                    color: "white"
                }
            }

            RowLayout {
                id: middleLayout
                anchors.centerIn: parent

                Text {
                    text: "centre"
                    color: "white"
                }
            }

            RowLayout {
                id: rightLayout
                anchors {
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                }

                BatteryWidget {
                    id: battery
                }

                ClockWidget {
                    id: clock
                }
            }
        }
    }
}
