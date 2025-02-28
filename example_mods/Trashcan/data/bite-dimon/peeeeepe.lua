playVideo = true;

function onCreate()
	setProperty('isCameraOnForcedPos', true)
end

function onStartCountdown()
	dimon = getRandomInt(1, 100);

	if playVideo and dimon == 100 and not seenCutscene then
		startVideo('mi juego es');
		playVideo = false;
		return Function_Stop;
	end

	if playVideo and dimon < 100 and not seenCutscene then
		startVideo('pepe', false);
		playVideo = false;
		return Function_Stop;
	end

	return Function_Continue; 
end

function onUpdate(elapsed)
	if difficultyName == 'Normal' then
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
    	end
	end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if noteType == 'muerte' then
		triggerEvent('Play Animation','grito','bf')
	end
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if noteType == 'spin' then
		triggerEvent('Play Animation','spin','dad')
	end

	if noteType == 'muerte' then
		triggerEvent('Play Animation','muerte','dad')
	end
end
