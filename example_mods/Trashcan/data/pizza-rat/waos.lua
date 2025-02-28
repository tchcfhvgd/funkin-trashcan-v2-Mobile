function onCreate()
	setProperty('introSoundsSuffix', '')
end

function onCreatePost()
    setProperty('iconP1.antialiasing', false)
	setProperty('iconP2.antialiasing', false)

    for i = 0, getProperty('unspawnNotes.length')-1 do
        setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
        setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/pizza')
    end
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'useRGBShader', false)
        setPropertyFromGroup('strumLineNotes', i, 'texture', 'noteSkins/pizza')
    end
end

function onSpawnNote(i, d)
    local splashes = {
        {0xF8E080, 0xFFFFFF, 0xC08038}, -- left
        {0xD07800, 0xFFFFFF, 0x783800}, -- down
        {0x5800B8, 0xFFFFFF, 0x4A3E63}, -- up
        {0xF80000, 0xFFFFFF, 0x500000} -- right
    }
    setPropertyFromGroup('notes', i, 'noteSplashData.r', splashes[d + 1][1])
    setPropertyFromGroup('notes', i, 'noteSplashData.g', splashes[d + 1][2])
    setPropertyFromGroup('notes', i, 'noteSplashData.b', splashes[d + 1][3])
end
