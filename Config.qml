pragma Singleton

import Quickshell.Io
import Quickshell
import QtQuick

Singleton {
    
    //read chosenTheme
    readonly property int chosenTheme: themeAdapter.chosenTheme
    readonly property var theme: themeAdapter.themes[chosenTheme]
    
    readonly property var bar: barAdapter.bar


    FileView {
        id: themes
        path: Qt.resolvedUrl("config/themes.json")
        watchChanges: true
        onFileChanged: reload()

        JsonAdapter {
            id: themeAdapter
            property int chosenTheme: 1
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