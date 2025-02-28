function onCreate()
	makeAnimatedLuaSprite('bg', 'stages/bomba/bg', 475, 375)
	addAnimationByPrefix('bg', 'bagroun', 'bagroun', 14, true)
	addLuaSprite('bg', false)

	makeLuaSprite('floor', 'stages/bomba/floor', 225, 1775)
	scaleObject('floor', 1, 1.25)
	addLuaSprite('floor', false)

	makeLuaSprite('trash', 'stages/bomba/trash', 725, 1500)
	addLuaSprite('trash', false)

    makeLuaSprite('basu', 'stages/bomba/basu', 2800, 1600)
    addLuaSprite('basu', false)
	
	close(true);
end