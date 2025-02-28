function onCreate()
    setCharacterX('boyfriend', 575)
    setCharacterX('dad', 25)

    setProperty('healthBar.flipX', true)
    setProperty('iconP1.flipX', true)
    setProperty('iconP2.flipX', true)
end

function onCountdownStarted()
    if middlescroll then
       return
    end
    for i = 0,3 do
        setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i])
        setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultPlayerStrumX'..i])
    end
end

function onUpdatePost(elapsed)
    x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
    x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
    setProperty('iconP1.x', x1)
    setProperty('iconP2.x', x2)
end
