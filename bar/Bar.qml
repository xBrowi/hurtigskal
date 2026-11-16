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
            margins {
                left: Config.bar.margin
                right: Config.bar.margin
                top: Config.bar.margin
            }
            implicitHeight: Config.bar.barHeight
            BackgroundEffect.blurRegion: Region { item: root.contentItem }
            color: "transparent"

            Rectangle {
                id: background
                color: Config.theme.transparentish
                anchors.fill: parent
                implicitHeight: Config.bar.barHeight
                radius: height/2
                




                RowLayout {
                    id: leftLayout
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }

                    Text {
                        text: "LYS TEXT"
                        color: Config.theme.lightText
                    }

                    

                }

                RowLayout {
                    id: middleLayout
                    anchors.centerIn: parent

                    WorkspaceWidget {id: workspace}
                }

                RowLayout {
                    id: rightLayout
                    anchors {
                        right: parent.right
                        top: parent.top
                        bottom: parent.bottom
                    }

                    AudioWidget{
                        id: audio
                        Layout.fillHeight: true
                    }

                    BatteryWidget {
                        visible: Battery.batteryPowered
                        id: battery
                        Layout.fillHeight: true
                    }

                    ClockWidget {
                        id: clock
                        Layout.fillHeight: true
                    }
                }
            }
        }
    }
}
