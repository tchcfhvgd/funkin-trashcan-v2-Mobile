function onCreatePost()
    runHaxeCode([[
        game.healthBar.bg.loadGraphic(Paths.image('stages/armadillo/Mierdaman'));
        game.healthBar.leftBar.loadGraphic(Paths.image('stages/armadillo/Bodrioman'));
        game.healthBar.rightBar.loadGraphic(Paths.image('stages/armadillo/Bodrioman'));
        game.healthBar.barWidth = Std.int(590);
        game.healthBar.barHeight = Std.int(game.healthBar.bg.height);
    ]])

    setProperty('healthBar.barOffset.x', getProperty('healthBar.barOffset.x') + 18)
    setProperty('healthBar.x', getProperty('healthBar.x') - 12)
    setProperty('healthBar.y', getProperty('iconP2.y') + 45)

    setProperty('iconP1.flipX', true)
    setProperty('iconP2.flipX', true)
    setProperty('healthBar.flipX', true)
end

function onUpdatePost()
	setProperty('iconP2.x', getMidpointX('healthBar') + 224)
    setProperty('iconP1.x', getMidpointX('healthBar') - 374)
end

function opponentNoteHit()
	health = getProperty('health')
	if getProperty ('health') > 0.05 then
	    setProperty ('health', health - 0.015);
	end
end
