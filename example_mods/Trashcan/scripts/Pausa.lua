function onCreate()
    precacheMusic('tilin')
end

function onCreatePost()
    og = getPropertyFromClass('backend.ClientPrefs', 'data.pauseMusic')

    if songName == 'Thunder Sex' then
        precacheMusic('yupanki')
        setPropertyFromClass('backend.ClientPrefs', 'data.pauseMusic', 'yupanki')
    else
        setPropertyFromClass('backend.ClientPrefs', 'data.pauseMusic', 'tilin')
    end
end

function onDestroy()
    setPropertyFromClass('backend.ClientPrefs', 'data.pauseMusic', og)
end
