function onCreate()
    if difficultyName == 'AVGN' then
        setCharacterX('boyfriend', 575)
        setCharacterX('dad', 25)

        setProperty('healthBar.flipX', true)
        setProperty('iconP1.flipX', true)
        setProperty('iconP2.flipX', true)
    end
end

function onUpdate(elapsed)
    if difficultyName == 'AVGN' then
	    if not middlescroll then
            for i = 0,3 do
                setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i]);
            end
            
            for i = 0,3 do
                setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultPlayerStrumX'..i]);
            end
	    end
    end
end

function onUpdatePost(elapsed)
    if difficultyName == 'AVGN' then
        x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
        x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
        setProperty('iconP1.x', x1)
        setProperty('iconP2.x', x2)
    end
end
