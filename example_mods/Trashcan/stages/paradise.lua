function onCreate()
	sapallo = getRandomInt(1,100)

	makeLuaSprite('cafe', 'stages/paradise/cafe', 0, 0)
	addLuaSprite('cafe', false)

	makeLuaSprite('shop1', 'stages/paradise/shop1', 0, 0)
	addLuaSprite('shop1', false)

	makeLuaSprite('shop2', 'stages/paradise/shop2', 0, 0)
	addLuaSprite('shop2', false)

	makeLuaSprite('shop3', 'stages/paradise/shop3', 0, 0)
	addLuaSprite('shop3', false)

	makeLuaSprite('objects', 'stages/paradise/objects', 0, 0)
	addLuaSprite('objects', false)

	makeLuaSprite('light', 'stages/paradise/light', 0, 0)
	addLuaSprite('light', false)
	setBlendMode('light', 'add')

	makeAnimatedLuaSprite('medina', 'stages/paradise/familiamedina', 1500, 960)
    addAnimationByPrefix('medina', 'familia medina', 'familia medina', 24, true)
	addLuaSprite('medina', false)

	makeLuaSprite('table', 'stages/paradise/table', 0, 0)
	addLuaSprite('table', false)

	makeAnimatedLuaSprite('barista', 'stages/paradise/barista', 1000, 745)
    addAnimationByIndices('barista', 'danceLeft', 'idle', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14', 24)
    addAnimationByIndices('barista', 'danceRight', 'idle', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29', 24)
	addLuaSprite('barista', false)
    scaleObject('barista', 1.3, 1.3)

	makeLuaSprite('chairs', 'stages/paradise/chairs', 0, 0)
	addLuaSprite('chairs', false)

	makeAnimatedLuaSprite('mono', 'stages/paradise/mono', 1615, 735)
	addAnimationByPrefix('mono', 'mono', 'MONO', 24, false)
	addLuaSprite('mono', false)
    scaleObject('mono', 1.3, 1.3)
	setObjectOrder('mono', getObjectOrder('gfGroup') + 1)
end

function onCreatePost()
	if sapallo < 34 then
		makeAnimatedLuaSprite('djs', 'stages/paradise/djs', 360, 660)
		addAnimationByPrefix('djs', 'djs', 'djs', 24, false)
		addLuaSprite('djs', false)
		scaleObject('djs', 1.3, 1.3)
	elseif sapallo < 67 then
		makeAnimatedLuaSprite('mcadore', 'stages/paradise/loverap', 2260, 550)
		addAnimationByPrefix('mcadore', 'idle', 'idle', 24, false)
		addLuaSprite('mcadore', false)
		scaleObject('mcadore', 1.3, 1.3)
	elseif sapallo < 100 then
		makeAnimatedLuaSprite('saffron', 'stages/paradise/saffron', 2460, 582)
		addAnimationByPrefix('saffron', 'idle', 'idle', 24, false)
		addLuaSprite('saffron', false)
		scaleObject('saffron', 1.3, 1.3)
	elseif sapallo == 100 then
		makeAnimatedLuaSprite('bootleg', 'stages/paradise/bootleg', 100, 720)
		addAnimationByPrefix('bootleg', 'idle', 'idle', 24, false)
		addLuaSprite('bootleg', false)
		scaleObject('bootleg', 1.3, 1.3)
	end
end

function onCountdownTick(counter)
    if counter % 2 == 0 then
        playAnim('barista', 'danceLeft', false)
    else
        playAnim('barista', 'danceRight', false)
    end

	if counter % 2 == 0 then
        playAnim('mono', 'mono', false)
    end

	if sapallo < 34 then
		if counter % 2 == 0 then
			playAnim('djs', 'djs', false)
		end
	elseif sapallo < 67 then
		if counter % 2 == 0 then
			playAnim('mcadore', 'idle', false)
		end
	elseif sapallo < 100 then
		if counter % 2 == 0 then
			playAnim('saffron', 'idle', false)
		end
	elseif sapallo == 100 then
		if counter % 2 == 0 then
			playAnim('bootleg', 'idle', false)
		end
	end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('barista', 'danceLeft', false)
    else
        playAnim('barista', 'danceRight', false)
    end

	if curBeat % 2 == 0 then
		playAnim('mono', 'mono', false)
	end

	if sapallo < 34 then
		if curBeat % 2 == 0 then
			playAnim('djs', 'djs', false)
		end
	elseif sapallo < 67 then
		if curBeat % 2 == 0 then
			playAnim('mcadore', 'idle', false)
		end
	elseif sapallo < 100 then
		if curBeat % 2 == 0 then
			playAnim('saffron', 'idle', false)
		end
	elseif sapallo == 100 then
		if curBeat % 2 == 0 then
			playAnim('bootleg', 'idle', false)
		end
	end
end
