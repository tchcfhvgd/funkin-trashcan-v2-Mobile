function onCreate()
    setProperty('introSoundsSuffix', '-torment')
end

function onCreatePost()
    runHaxeCode([[
        game.healthBar.bg.loadGraphic(Paths.image('stages/torment/torment barra'));
        game.healthBar.leftBar.loadGraphic(Paths.image('stages/torment/torment barra bg'));
        game.healthBar.rightBar.loadGraphic(Paths.image('stages/torment/torment barra bg'));
        game.healthBar.barWidth = Std.int(597);
        game.healthBar.barHeight = Std.int(game.healthBar.bg.height);
    ]])
    
    screenCenter('healthBar', 'x')
    setProperty('healthBar.barOffset.x', getProperty('healthBar.barOffset.x') + 22)
    setProperty('healthBar.y', getProperty('iconP2.y') + 42)

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

function onUpdatePost()
    x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
    x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
    setProperty('iconP1.x', x1)
    setProperty('iconP2.x', x2)
end
