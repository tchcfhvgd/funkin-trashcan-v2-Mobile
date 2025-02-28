function onCreate()
	makeLuaSprite('fondo', 'stages/pizza/fondotower', -90, 295)
	addLuaSprite('fondo', false)
	setProperty('fondo.antialiasing', false)
	setScrollFactor('fondo', 0.6, 1.0)

	makeLuaSprite('suelo', 'stages/pizza/suelotower', -65, 295)
	addLuaSprite('suelo', false)
	setProperty('suelo.antialiasing', false)
	
	close(true);
end