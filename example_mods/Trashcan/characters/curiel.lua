local anims = {'singLEFT-alt', 'singDOWN-alt', 'singUP-alt', 'singRIGHT-alt'}
local elpepe = false

function goodNoteHit(i, d, t, s)
	if combo == 30 and not s then
		elpepe = true
		characterPlayAnim('gf', 'cheer')
		setProperty('gf.skipDance', true)
	end

	if elpepe then
	    characterPlayAnim('bf', anims[d + 1])
	end
end

function noteMiss(i, d, t, s)
	elpepe = false
end

function onBeatHit()
	if getProperty('gf.animation.curAnim.finished') == true then
		setProperty('gf.skipDance', false)
	end
end