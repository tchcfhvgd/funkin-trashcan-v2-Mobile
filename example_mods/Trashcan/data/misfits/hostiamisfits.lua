playVideo = true;

function onCreate()
	setObjectOrder('gfGroup', getObjectOrder('boyfriendGroup') + 1)
	setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup'))

	makeLuaSprite('blackSquare', '', 0, 0)
    makeGraphic('blackSquare', 1280, 720, '000000')
    setObjectCamera('blackSquare', 'hud')
    screenCenter('blackSquare')
    addLuaSprite('blackSquare', true)
	setObjectOrder('blackSquare', 14)
end

function onStartCountdown()
	timethework = getRandomInt(1, 100);

	if playVideo and timethework == 100 and not seenCutscene then
		startVideo('timethework');
		playVideo = false;
		return Function_Stop;
	end

	if playVideo and timethework < 100 and not seenCutscene then
		startVideo('nomamelamisfit');
		playVideo = false;
		return Function_Stop;
	end

	return Function_Continue; 
end

function onSongStart()
	doTweenAlpha('blackSquare', 'blackSquare', 0, 2)
end

function onStepHit()
	if curStep == 1504 then
		setObjectOrder('blackSquare', 19)
		doTweenAlpha('blackSquare2', 'blackSquare', 1, 2.5)
	end
end

function onUpdatePost(elapsed)
	setProperty('iconP2.x', getProperty('iconP1.x') - 125)
	setProperty('iconP1.x', getProperty('iconP2.x') + 135)
    setProperty('iconP2.origin.x', 300)
	setProperty('iconP1.origin.x', 0)
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if curStep <= 478 or curStep >= 488 then
		if noteType == '' then
			setHealthBarColors('276d1d', '')

			runHaxeCode("game.iconP2.changeIcon('ogorki');");
		end
	end

	if noteType == 'harry' then
		setHealthBarColors('308bd1', '')

		runHaxeCode("game.iconP2.changeIcon('harry');");
	end

	if noteType == 'novies' then
		setHealthBarColors('276d1d', '')

		runHaxeCode("game.iconP2.changeIcon('bootleg');");
	end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if curStep <= 606 or curStep >= 616 then
		if noteType == '' then
			setHealthBarColors('', 'a349a4')

			runHaxeCode("game.iconP1.changeIcon('coldsteel');");
		end
	end

	if noteType == 'GF Sing' then
		setHealthBarColors('', '00e1c8')

		runHaxeCode("game.iconP1.changeIcon('soniku');");
	end

	if noteType == 'novios' then
		setHealthBarColors('', 'a349a4')

		runHaxeCode("game.iconP1.changeIcon('recolor');");
	end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
	if curStep <= 606 or curStep >= 616 then
		if noteType == '' then
			setHealthBarColors('', 'a349a4')

			runHaxeCode("game.iconP1.changeIcon('coldsteel');");
		end
	end

	if noteType == 'GF Sing' then
		setHealthBarColors('', '00e1c8')

		runHaxeCode("game.iconP1.changeIcon('soniku');");
	end

	if noteType == 'novios' then
		setHealthBarColors('', 'a349a4')

		runHaxeCode("game.iconP1.changeIcon('recolor');");
	end
end
