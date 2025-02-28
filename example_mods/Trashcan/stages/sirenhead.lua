function onCreate()
	makeLuaSprite('room', 'stages/sirenhead/fondo', -685, -114)
	addLuaSprite('room', false)
	setScrollFactor('room', 0.95, 0.95)

	makeAnimatedLuaSprite('door', 'stages/sirenhead/door', -445, 72)
    addAnimationByPrefix('door', 'door', 'doordevil', 24, true)
	addAnimationByPrefix('door', 'spawn', 'devildoorspawn', 24, false)
    addOffset('door', 'door', 0, 0)
    addOffset('door', 'spawn', 101, 94)
    addLuaSprite('door', false)
	setScrollFactor('door', 0.95, 0.95)
	setProperty('door.alpha', 0.0000000000001)

    makeAnimatedLuaSprite('clot1', 'stages/sirenhead/clot', 490, 810)
    addAnimationByIndices('clot1', 'danceLeft', 'clot', '0,1,2,3,4,5,6,7,8,9,10,11,12,13', 24)
    addAnimationByIndices('clot1', 'danceRight', 'clot', '14,15,16,17,18,19,20,21,22,23,24,25,26,27', 24)
    addLuaSprite('clot1', true)

    makeAnimatedLuaSprite('clot2', 'stages/sirenhead/clot', 840, 730)
    addAnimationByIndices('clot2', 'danceLeft', 'clot', '0,1,2,3,4,5,6,7,8,9,10,11,12,13', 24)
    addAnimationByIndices('clot2', 'danceRight', 'clot', '14,15,16,17,18,19,20,21,22,23,24,25,26,27', 24)
    addLuaSprite('clot2', false)

	makeLuaSprite('overlay', 'stages/sirenhead/overlay', -1080, -100)
	addLuaSprite('overlay', true)
	setBlendMode('overlay', 'overlay')
	setScrollFactor('overlay', 1.2, 1.2)

    makeLuaSprite('bordes', 'stages/sirenhead/bordes', 0, 0)
	addLuaSprite('bordes', false)
    setObjectCamera('bordes', 'hud')
    scaleObject('bordes', 0.5, 0.5)
    setBlendMode('bordes', 'multiply')
    setProperty('bordes.alpha', 0.0000000000001)
end

function onCountdownTick(counter)
    if counter % 2 == 0 then
        playAnim('clot1', 'danceLeft', false)
        playAnim('clot2', 'danceLeft', false)
    else
        playAnim('clot1', 'danceRight', false)
        playAnim('clot2', 'danceRight', false)
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('clot1', 'danceLeft', false)
        playAnim('clot2', 'danceLeft', false)
    else
        playAnim('clot1', 'danceRight', false)
        playAnim('clot2', 'danceRight', false)
    end
end