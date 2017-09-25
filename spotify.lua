local spotify = {}

function spotify.toggle()
    if (hs.spotify.isPlaying()) then
        hs.spotify.pause()
    else
        hs.spotify.play()
    end
end

function spotify.next()
    hs.spotify.next()
end

function spotify.previous()
    hs.spotify.previous()
end

function spotify.playing()
    local album = hs.spotify.getCurrentAlbum()
    local artist = hs.spotify.getCurrentArtist()
    local track = hs.spotify.getCurrentTrack()

    hs.alert.show("Now playing: \n" .. artist .. " - " .. track .. " - " .. album)
end

return spotify
