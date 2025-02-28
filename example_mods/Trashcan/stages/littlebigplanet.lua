function onCreate()
    setBlendMode('overlay', 'overlay')
    setBlendMode('overlay2', 'overlay')
end

function onCountdownTick(counter)
	if counter % 2 == 0 then
        playAnim('caja', 'beatbox', false)
    end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		playAnim('caja', 'beatbox', false)
	end
end