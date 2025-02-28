function onCreatePost()
    runHaxeCode([[
        game.healthBar.bg.loadGraphic(Paths.image('stages/pizza/Barra'));
        game.healthBar.leftBar.loadGraphic(Paths.image('stages/pizza/Barrafondo'));
        game.healthBar.rightBar.loadGraphic(Paths.image('stages/pizza/Barrafondo'));
        game.healthBar.barWidth = Std.int(game.healthBar.bg.width);
        game.healthBar.barHeight = Std.int(game.healthBar.bg.height);
    ]])

	setProperty('healthBar.x', getProperty('healthBar.x') - 12)
    setProperty('healthBar.y', getProperty('iconP2.y') + 45)

    setProperty('healthBar.leftBar.antialiasing', false)
    setProperty('healthBar.rightBar.antialiasing', false)
    setProperty('healthBar.bg.antialiasing', false)
end