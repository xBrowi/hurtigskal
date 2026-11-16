pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
    readonly property var sink: Pipewire.defaultAudioSink

    PwObjectTracker {
        objects: [sink]
    }

    readonly property bool ready: Pipewire.ready && sink && sink.ready && sink.audio
    readonly property bool muted: ready && sink.audio.muted
    readonly property int volume: ready ? Math.round(sink.audio.volume * 100) : -1
}