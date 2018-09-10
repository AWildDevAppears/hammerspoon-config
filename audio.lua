local audio = {}

function audio.volDown5()
    hs.audiodevice.defaultOutputDevice()
        :setVolume(hs.audiodevice.current().volume - 5)
    hs.alert.show(string.format("Volume: %.0f", hs.audiodevice.current().volume))
end

function audio.volUp5()
    hs.audiodevice.defaultOutputDevice()
        :setVolume(hs.audiodevice.current().volume + 5)
    hs.alert.show(string.format("Volume: %.0f", hs.audiodevice.current().volume))
end

function audio.volDown10()
    hs.audiodevice.defaultOutputDevice()
        :setVolume(hs.audiodevice.current().volume - 10)
    hs.alert.show(
        string.format("Volume: %.0f", hs.audiodevice.current().volume)
    )
end

function audio.volUp10()
    hs.audiodevice.defaultOutputDevice()
        :setVolume(hs.audiodevice.current().volume + 10)
    hs.alert.show(
        string.format("Volume: %.0f", hs.audiodevice.current().volume)
    )
end

return audio
