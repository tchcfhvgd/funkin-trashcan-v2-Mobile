local camera = true

function onCreate()
    addCharacterToList('cohok', 'dad')
    addCharacterToList('octoling', 'boyfriend')
    
    setProperty('gf.alpha', 0)
    setProperty('dad.alpha', 0)
    setProperty('iconP2.alpha', 0)

    setProperty('healthBar.flipX', true)
    setProperty('iconP1.flipX', true)
    setProperty('iconP2.flipX', true)
end

function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes', i, 'x', -330)
    end
end

function onCountdownStarted()
    if middlescroll then
       return
    end
    for i = 0,3 do
        setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i])
    end
end

function onUpdatePost(elapsed)
    x1 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) - (150 * getProperty('iconP1.scale.x')) / 2 - 26 * 2
    x2 = getProperty('healthBar.x') + (getProperty('healthBar.width') * (((100 - (100 - (getProperty('healthBar.percent'))))) * 0.01)) + (150 * getProperty('iconP2.scale.x') - 150) / 2 - 26
    setProperty('iconP1.x', x1)
    setProperty('iconP2.x', x2)
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
	health = getProperty('health')
    if curStep >= 592 and curStep <= 1008 then
        if noteType == '' then
	        if getProperty ('health') > 0.05 then
	            setProperty ('health', health - 0.015);
            end
        end
	end
end

function onSectionHit()
    if curSection == 34 or curSection == 62 then
        camera = false
    elseif curSection == 38 or curSection == 66 then
        camera = true
    end

    if camera == true then
        if mustHitSection then
            setProperty('defaultCamZoom', 0.66)
            cameraSetTarget('boyfriend')
        else
            setProperty('defaultCamZoom', 0.9)
            triggerEvent('Camera Follow Pos', 1100, -70)
        end
    end
end
