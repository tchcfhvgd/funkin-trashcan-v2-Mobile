function onCreate()
	-- esta verga tomo 2 horas
        -- Esto lo hizo zozer jaja que malo
	makeLuaSprite('Bg', 'stages/infiltred/cieloinfiltred', -1650, -787)
	setScrollFactor('Bg', 0.5, 0.5)
        addLuaSprite('Bg', false)
        setProperty('Bg.antialiasing', false)

        makeAnimatedLuaSprite('luces', 'stages/infiltred/luces', -175, 840)
        addAnimationByPrefix('luces', 'luces', 'luces', 24, true)
        addLuaSprite('luces', false)
        setProperty('luces.antialiasing', false)

	makeLuaSprite('suelo', 'stages/infiltred/sueloinfiltred', -1632, -1187)
	addLuaSprite('suelo', false)
        setProperty('suelo.antialiasing', false)

        close(true);
end
