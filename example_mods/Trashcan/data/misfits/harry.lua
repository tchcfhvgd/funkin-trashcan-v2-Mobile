local tag = 'harry' -- name tag of character
local x = -425 -- x position
local y = 170 -- y position
local character = 'harry' -- name of json file

-- notetypes that the character will sing on
-- you can configure with the variables to get the effect you want
local noteTypes = {
    ['harry'] = {
        noAnimation = true, -- if this is true, real opponent or player will not sing along with the extra character
    },
    ['novies'] = {
        noAnimation = false, -- if this is true, real opponent or player will not sing along with the extra character
    }
}

------------------------------------------------------------------------------------------------------------------------------------------------

createInstance(tag, 'objects.Character', {x, y, character, isPlayer})
addInstance(tag)
setObjectOrder(tag, getObjectOrder('dadGroup') + 1)

function onCountdownTick(counter)
    if getProperty(tag..'.danceIdle') or counter % 2 == 0 then
        callMethod(tag..'.dance')
    end
end

function onBeatHit()
    if curBeat % getProperty(tag..'.danceEveryNumBeats') == 0 and not stringStartsWith(getProperty(tag..'.animation.name'), 'sing') and not getProperty(tag..'.stunned') then
        callMethod(tag..'.dance')
    end
end

function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        for name, setting in pairs(noteTypes) do
            if getProperty('unspawnNotes['..i..'].noteType') == name then
                setProperty('unspawnNotes['..i..'].noAnimation', setting.noAnimation)
            end
        end
    end
end

function opponentNoteHit(_, d, t)
    for name, setting in pairs(noteTypes) do
        if t == name and not isPlayer then
            playAnim(tag, getProperty('singAnimations') [d+1], true)
            setProperty(tag..'.holdTimer', 0)
        end
    end
end
