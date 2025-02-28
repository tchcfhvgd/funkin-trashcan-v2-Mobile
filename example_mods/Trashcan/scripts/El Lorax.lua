function onSongStart()
    lorax = getRandomInt(1, 4096) -- The Lorax is shiny

    if songName ~= 'Lorax' then
        if lorax == 2012 then
            loadSong('lorax')
        end
    end
end