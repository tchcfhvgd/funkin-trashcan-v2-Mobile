function onSpawnNote(i, d)
    local splashes = {
        {0xC24B99, 0xFFFFFF, 0x3C1F56}, -- left
        {0x00FFFF, 0xFFFFFF, 0x1542B7}, -- down
        {0x12FA05, 0xFFFFFF, 0x0A4447}, -- up
        {0xF9393F, 0xFFFFFF, 0x651038} -- right
    }
    setPropertyFromGroup('notes', i, 'shader', nil)
    setPropertyFromGroup('notes', i, 'noteSplashData.r', splashes[d + 1][1])
    setPropertyFromGroup('notes', i, 'noteSplashData.g', splashes[d + 1][2])
    setPropertyFromGroup('notes', i, 'noteSplashData.b', splashes[d + 1][3])
end

function onUpdatePost()
    if startedCountdown and not inGameOver then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'shader', nil)
        end
    end
end
