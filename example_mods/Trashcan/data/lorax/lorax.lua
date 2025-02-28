function onCreate()
	setProperty('healthBar.alpha', 0)
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)

	setProperty('skipCountdown', true)

	startVideo('lorax', false, true, true)
	setObjectCamera('videoCutscene', 'hud')
	setObjectOrder('videoCutscene', 0)
end

function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes', i, 'x', -330)
    end
end

function onGameOver()
	io.popen('start mods/Trashcan/videos/doyouloveme.mp4')
	os.exit();
end

function onPause()
	return Function_Stop
end

function onEndSong()
	os.exit();
end