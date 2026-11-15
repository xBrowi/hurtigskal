import Quickshell // for PanelWindow
import QtQuick // for Text
import QtQuick.Layouts
import Quickshell.Wayland
import ".."



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

            color: Config.theme.primary1
            implicitHeight: Config.bar.barHeight
            BackgroundEffect.blurRegion: Region { item: root.contentItem }
            margins {
                left: Config.bar.margin
                right: Config.bar.margin
                top: Config.bar.margin
            }




            RowLayout {
                id: leftLayout
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }

                Text {
                    text: "HVID"
                    color: Config.theme.primary1
                }

                WorkspaceWidget {id: workspace}

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
                    visible: Battery.batteryPowered
                    id: battery
                }

                ClockWidget {
                    id: clock
                }
            }
        }
    }
}
