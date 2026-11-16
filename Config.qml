pragma Singleton

import Quickshell.Io
import Quickshell
import QtQuick

Singleton {
    readonly property var defaultTheme: ({
        transparentish: "#b33fd6db",
        lightText: "#7affff",
        darkText: "rgb(0, 72, 72)",
        mediumText: "rgb(53, 157, 157)"
    })
    readonly property var defaultBar: ({
        barHeight: 30,
        margin: 3
    })

    //read chosenTheme
    readonly property int chosenTheme: themeAdapter.chosenTheme
    readonly property var theme: themeAdapter.themes.length > chosenTheme
        ? themeAdapter.themes[chosenTheme]
        : defaultTheme
    
    readonly property var bar: barAdapter.bar || defaultBar


    FileView {
        id: themes
        path: Qt.resolvedUrl("config/themes.json")
        watchChanges: true
        onFileChanged: reload()

        JsonAdapter {
            id: themeAdapter
            property int chosenTheme: 0
            onChosenThemeChanged: {
                console.log("chosenTheme: " + chosenTheme)
            }
            property var themes: []
            
        }
        

    }

    FileView {
        id: bar
        path: Qt.resolvedUrl("config/bar.json")
        watchChanges: true
        onFileChanged: reload()

        JsonAdapter {
            id: barAdapter
            
            property var bar

            
        }
    }


    

}