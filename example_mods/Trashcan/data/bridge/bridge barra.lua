function onCreatePost()
    runHaxeCode([[
        game.healthBar.bg.loadGraphic(Paths.image('stages/bridge/emptybar'));
        game.healthBar.leftBar.loadGraphic(Paths.image('stages/bridge/godom'));
        game.healthBar.rightBar.loadGraphic(Paths.image('stages/bridge/wrig'));
        game.healthBar.barWidth = Std.int(500);
        game.healthBar.barHeight = Std.int(game.healthBar.bg.height);
    ]])

    setProperty('healthBar.barOffset.x', getProperty('healthBar.barOffset.x') + 50)
    setProperty('healthBar.y', getProperty('iconP1.y') + 20)
end