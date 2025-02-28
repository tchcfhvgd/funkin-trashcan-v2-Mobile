function onCreate()
    if songName == 'Misfits' or boyfriendName == 'etan' then
    
    else
	    setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'mauricio')
	    setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'basurero')
    end
end

function onGameOver()
    if songName == 'Misfits' or boyfriendName == 'etan' then
    
    else
        setProperty('camGame.zoom', 0.9)
        setProperty('boyfriendGroup.x', 0)
        setProperty('boyfriendGroup.y', 0)
        setProperty('camGame.scroll.x', -45.5 - (screenWidth / 2))
        setProperty('camGame.scroll.y', 622 - (screenWidth / 2))
    end
end