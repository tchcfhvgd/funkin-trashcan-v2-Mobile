function onCreatePost()
    doTweenAngle('sexo', 'iconP2', 360, 15, 'linear')
end

function onUpdatePost()
    if getProperty('healthBar.percent') > 80 and getProperty('iconP1.animation.curAnim.numFrames') > 2 then
        setProperty('iconP1.animation.curAnim.curFrame', 2)
    elseif getProperty('healthBar.percent') < 20 and getProperty('iconP2.animation.curAnim.numFrames') > 2 then
        setProperty('iconP2.animation.curAnim.curFrame', 2)
    end
end

function onTweenCompleted(tag)
    if tag == 'sexo' then
        setProperty('iconP2.angle', 0)
        doTweenAngle('sexo', 'iconP2', 360, 15, 'linear')
    end
end

function opponentNoteHit()
	health = getProperty('health')
	if getProperty ('health') > 0.05 then
	    setProperty ('health', health - 0.015);
	end
end