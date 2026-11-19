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
                        top: parent.top
                        bottom: parent.bottom
                    }

                    SelfDestruct {
                        id: dø
                        Layout.fillHeight: true
                    }

                    
                }

                RowLayout {
                    id: middleLayout
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.top
                        bottom: parent.bottom
                    }

                    WorkspaceWidget {
                        id: workspace
                        Layout.fillHeight: true
                    }
                }

                RowLayout {
                    id: rightLayout
                    anchors {
                        right: parent.right
                        top: parent.top
                        bottom: parent.bottom
                    }

                    TrayWidget {
                        id: tray
                        Layout.fillHeight: true
                    }

                    NetworkWidget{
                        id: network
                        Layout.fillHeight: true
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
