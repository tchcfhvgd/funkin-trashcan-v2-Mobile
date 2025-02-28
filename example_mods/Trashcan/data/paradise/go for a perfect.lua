function onCreate()
    precacheSound('Pfail')

    makeLuaSprite('Go for a Perfect', 'stages/paradise/perfecto', 94, 4)

	makeAnimatedLuaSprite('P', 'stages/paradise/P', 20, 14)
	addAnimationByPrefix('P', 'Pidle', 'Pidle', 44, false)
	addAnimationByPrefix('P', 'P fail', 'P fail', 44, false)
	addAnimationByPrefix('P', 'el pp', 'el pp', 44, false)
end

function onSongStart()
	addLuaSprite('Go for a Perfect', true)
	setProperty('Go for a Perfect.antialiasing', true)
	setObjectCamera('Go for a Perfect', 'hud')
	setObjectOrder('Go for a Perfect', 100)

	addLuaSprite('P', true)
	scaleObject('P', 0.85, 0.85)
	setProperty('P.antialiasing', true)
	setObjectCamera('P', 'hud')
	setObjectOrder('P', 99)
	addOffset('P', 'Pidle', 0, 0)
	addOffset('P', 'P fail', 12, 11)
	addOffset('P', 'el pp', 4.2, 13)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        setProperty('Go for a Perfect.alpha', 0)
    end
    
    if curBeat % 4 == 0 then
        setProperty('Go for a Perfect.alpha', 1)
    end
end

function onUpdate()
	if botPlay then
		removeLuaSprite('Go for a Perfect')
		removeLuaSprite('P')
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if isSustainNote == false and misses == 0 then
		playAnim('P', 'el pp', true)
	end
end

function onUpdateScore(miss)
	if misses == 1 then
		removeLuaSprite('Go for a Perfect')
		playAnim('P', 'P fail')
		playSound('Pfail')
		runTimer('chau', 0.9)
	end
end

function onTimerCompleted(tag)
	if tag == 'chau' then
		removeLuaSprite('P')
	end
end
