function onCreate()
	makeLuaSprite('sky', 'stages/balanced/sky', -35, -265)
	addLuaSprite('sky', false)
	setScrollFactor('sky', 0.9, 0.3)

	makeLuaSprite('cosas', 'stages/balanced/cosas', -35, -180)
	addLuaSprite('cosas', false)
	setScrollFactor('cosas', 0.9, 0.6)

	makeLuaSprite('agua', 'stages/balanced/agua', -35, -65)
	addLuaSprite('agua', false)
	setScrollFactor('agua', 0.9, 0.8)

	makeLuaSprite('piso', 'stages/balanced/piso', 0, 0)
	addLuaSprite('piso', false)

	setObjectOrder('dadGroup', getObjectOrder('piso') - 1)
	setObjectOrder('gfGroup', getObjectOrder('piso') - 1)

	makeLuaSprite('lineas', '', 0, -30)
    makeGraphic('lineas', 1280, 100, '000000')
    addLuaSprite('lineas', true)
    setObjectCamera('lineas', 'hud')

	makeLuaSprite('hotline', '', 0, 650)
    makeGraphic('hotline', 1280, 100, '000000')
    addLuaSprite('hotline', true)
    setObjectCamera('hotline', 'hud')

    close(true);
end
