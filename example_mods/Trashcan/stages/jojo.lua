function onCreate()
	makeLuaSprite('cieloCiuda', 'stages/jojo/cieloCiuda', -100, -550)
	addLuaSprite('cieloCiuda', false)
	setScrollFactor('cieloCiuda', 0.8, 0.8)
	
	makeLuaSprite('edifIzquierda', 'stages/jojo/edifIzquierda', 0, -610)
	addLuaSprite('edifIzquierda', false)

	makeLuaSprite('edifDerecha', 'stages/jojo/edifDerecha', 0, -610)
	addLuaSprite('edifDerecha', false)

	makeLuaSprite('pavimento', 'stages/jojo/pavimento', 0, -625)
	addLuaSprite('pavimento', false)

	makeLuaSprite('caracolesViejo', 'stages/jojo/caracolesViejo', 0, -625)
	addLuaSprite('caracolesViejo', false)

	makeAnimatedLuaSprite('anasui', 'stages/jojo/anasui', 25, 70)
	addAnimationByPrefix('anasui', 'anasui', 'anasui', 24, false)
    addLuaSprite('anasui', false)
	scaleObject('anasui', 0.8, 0.8)

	makeLuaSprite('caracolFg', 'stages/jojo/caracolFg', 0, -625)
	addLuaSprite('caracolFg', true)

	makeLuaSprite('luzArcoiris', 'stages/jojo/luzArcoiris', 0, -625)
	addLuaSprite('luzArcoiris', true)
	setBlendMode('luzArcoiris', 'add')

	makeLuaSprite('lineas', '', 0, -40)
    makeGraphic('lineas', 1280, 100, '000000')
    setObjectCamera('lineas', 'hud')
	setObjectOrder('lineas', 6)

	makeLuaSprite('hotline', '', 0, 660)
    makeGraphic('hotline', 1280, 100, '000000')
    setObjectCamera('hotline', 'hud')
	setObjectOrder('hotline', 6)
end

function onBeatHit()
	if curBeat % 2 == 0 then
        playAnim('anasui', 'anasui', false, false, 0)
	end
end