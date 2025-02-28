function onUpdate(elapsed)
    setProperty('layer1.x', getProperty('layer1.x') - 2)
    setProperty('layer1 dimon.x', getProperty('layer1 dimon.x') - 2)
    setProperty('layer1dos.x', getProperty('layer1.x') + getProperty('layer1.width'))
    setProperty('layer1dos dimon.x', getProperty('layer1 dimon.x') + getProperty('layer1 dimon.width'))

    setProperty('layer2.x', getProperty('layer2.x') - 1)
    setProperty('layer2 dimon.x', getProperty('layer2 dimon.x') - 1)
    setProperty('layer2dos.x', getProperty('layer2.x') + getProperty('layer2.width'))
    setProperty('layer2dos dimon.x', getProperty('layer2 dimon.x') + getProperty('layer2 dimon.width'))

	setProperty('layer3.x', getProperty('layer3.x') - 0.5)
    setProperty('layer3 dimon.x', getProperty('layer3 dimon.x') - 0.5)
	setProperty('layer3dos.x', getProperty('layer3.x') + getProperty('layer3.width') + 20)
    setProperty('layer3dos dimon.x', getProperty('layer3 dimon.x') + getProperty('layer3 dimon.width') + 20)

    if getProperty('layer1dos.x') <= -540 then
        setProperty('layer1.x', -540)
        setProperty('layer1 dimon.x', -540)
    end

    if getProperty('layer2dos.x') <= -542 then
        setProperty('layer2.x', -542)
        setProperty('layer2 dimon.x', -542)
    end

	if getProperty('layer3dos.x') <= -500 then 
        setProperty('layer3.x', -500)
        setProperty('layer3 dimon.x', -500)
    end
end