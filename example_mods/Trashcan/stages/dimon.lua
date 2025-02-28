function onCreate()
	makeLuaSprite('skybox dimon', 'stages/dimon/skybox dimon', -550, -110)
	addLuaSprite('skybox dimon', false)

	makeLuaSprite('layer3 dimon', 'stages/dimon/layer3 dimon', -500, -50)
	addLuaSprite('layer3 dimon', false)
	makeLuaSprite('layer3dos dimon', 'stages/dimon/layer3 dimon', getProperty('layer3 dimon.x') + getProperty('layer3 dimon.width') + 20, -50)
	addLuaSprite('layer3dos dimon', false)

	makeLuaSprite('layer2 dimon', 'stages/dimon/layer2 dimon', -542, 150)
	addLuaSprite('layer2 dimon', false)
	makeLuaSprite('layer2dos dimon', 'stages/dimon/layer2 dimon', getProperty('layer2 dimon.x') + getProperty('layer2 dimon.width'), 150)
	addLuaSprite('layer2dos dimon', false)

	makeLuaSprite('layer1 dimon', 'stages/dimon/layer1 dimon', -540, 250)
	addLuaSprite('layer1 dimon', false)
	makeLuaSprite('layer1dos dimon', 'stages/dimon/layer1 dimon', getProperty('layer1 dimon.x') + getProperty('layer1 dimon.width'), 250)
	addLuaSprite('layer1dos dimon', false)

	makeAnimatedLuaSprite('emblem dimon', 'stages/dimon/emblem dimon', -225, 75)
	addAnimationByPrefix('emblem dimon', 'emblem dimon', 'emblem', 24, true)
	addLuaSprite('emblem dimon', false)

	makeLuaSprite('skybox', 'stages/dimon/skybox', -550, -110)
	addLuaSprite('skybox', false)

	makeLuaSprite('layer3', 'stages/dimon/layer3', -500, -50)
	addLuaSprite('layer3', false)
	makeLuaSprite('layer3dos', 'stages/dimon/layer3', getProperty('layer3.x') + getProperty('layer3.width') + 20, -50)
	addLuaSprite('layer3dos', false)

	makeLuaSprite('layer2', 'stages/dimon/layer2', -542, 150)
	addLuaSprite('layer2', false)
	makeLuaSprite('layer2dos', 'stages/dimon/layer2', getProperty('layer2.x') + getProperty('layer2.width'), 150)
	addLuaSprite('layer2dos', false)

	makeLuaSprite('layer1', 'stages/dimon/layer1', -540, 250)
	addLuaSprite('layer1', false)
	makeLuaSprite('layer1dos', 'stages/dimon/layer1', getProperty('layer1.x') + getProperty('layer1.width'), 250)
	addLuaSprite('layer1dos', false)

	makeLuaSprite('emblem', 'stages/dimon/emblem', -225, 75)
	addLuaSprite('emblem', false)

	makeLuaSprite('sonicname', 'stages/dimon/sonicname', -150, 400)
	addLuaSprite('sonicname', false)
	setObjectOrder('sonicname', 19)
	
	close(true);
end