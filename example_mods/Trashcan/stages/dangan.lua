function onCreate()
	setBlendMode('overlay', 'overlay')

    makeLuaSprite('lineas', '', 0, -40)
    makeGraphic('lineas', 1280, 105, '000000')
    setObjectCamera('lineas', 'hud')
	setObjectOrder('lineas', 6)

	makeLuaSprite('hotline', '', 0, 655)
    makeGraphic('hotline', 1280, 105, '000000')
    setObjectCamera('hotline', 'hud')
	setObjectOrder('hotline', 6)

    close(true);
end