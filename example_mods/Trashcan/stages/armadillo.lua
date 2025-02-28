function onCreate()
	makeLuaSprite('bgX', 'stages/armadillo/bgX', -251, 424)
	scaleObject('bgX', 1.1, 1.1)
	addLuaSprite('bgX', false)

	makeLuaSprite('Shader', 'stages/armadillo/Shader', -275, -255)
	scaleObject('Shader', 2, 1.22)
	addLuaSprite('Shader', true)
	setBlendMode('Shader', 'add')
	setProperty('Shader.alpha', 0.7)

	makeLuaSprite('lineas', '', 0, -30)
    makeGraphic('lineas', 1280, 100, '000000')
    addLuaSprite('lineas', true)
	setScrollFactor('lineas', 0, 0)
    setObjectCamera('lineas', 'hud')

	makeLuaSprite('hotline', '', 0, 650)
    makeGraphic('hotline', 1280, 100, '000000')
    addLuaSprite('hotline', true)
	setScrollFactor('hotline', 0, 0)
    setObjectCamera('hotline', 'hud') 

    close(true);
end
