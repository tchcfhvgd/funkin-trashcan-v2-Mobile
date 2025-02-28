local images = {}
local imageData = {}
local currentIndex = 1

function onCreate()
    playMusic('gallery/trashbio', 1, true)

    setProperty('allowDebugKeys', false)
    setProperty('boyfriend.alpha', 0)
    setProperty('dad.alpha', 0)
    setProperty('gf.alpha', 0)
    setProperty('camHUD.alpha', 0)

    makeLuaSprite('fondo', 'gallery/fondo', 0, 0)
    addLuaSprite('fondo')
    setObjectCamera('fondo', 'other')
    screenCenter('fondo')

    for i = 0,1 do
        makeLuaSprite('bar'..i, 'gallery/bar'..i, 0, 0)
        addLuaSprite('bar'..i)
        setObjectCamera('bar'..i, 'other')

        makeAnimatedLuaSprite('flecha'..i, 'gallery/flecha', 0, 0)
        addAnimationByPrefix('flecha'..i, 'flecha', 'flecha', 24, true)
        addAnimationByIndices('flecha'..i, 'select', 'select', '0,1,2,3,4,5,6', 24, false)
        addLuaSprite('flecha'..i, false)
        setObjectCamera('flecha'..i, 'other')
        screenCenter('flecha'..i, 'y')
    end

    setProperty('flecha0.x', 20)
    setProperty('flecha1.x', 1118)
    setProperty('flecha0.flipX', true)

	makeLuaText('counter', '', 0, 1118, 30)
	addLuaText('counter')
	setObjectCamera('counter', 'other')
    setTextSize('counter', 30)

    makeLuaText('text1', '', 0, 0, 30)
	addLuaText('text1')
	setObjectCamera('text1', 'other')
    setTextSize('text1', 30)

    makeLuaText('text2', '', 0, 0, 660)
	addLuaText('text2')
	setObjectCamera('text2', 'other')
    setTextSize('text2', 30)

    local folderPath = 'dumpster/Trashgallery/images/gallery/img'
    local imageFiles = getImagesFromFolder(folderPath)

    for i, fileName in ipairs(imageFiles) do
        local spriteName = 'img' .. i
        local imagePath = 'gallery/img/' .. fileName
        local txtPath = 'images/gallery/img/' .. fileName .. '.txt'

        makeLuaSprite(spriteName, imagePath, 0, 0)
        addLuaSprite(spriteName, false)
        setObjectCamera(spriteName, 'other')

        local fileContent = getTextFromFile(txtPath)
        local properties = parseProperties(fileContent)
        applyImageProperties(spriteName, properties)
        imageData[spriteName] = properties

        screenCenter(spriteName)
        setProperty(spriteName .. '.alpha', (i == currentIndex) and 1 or 0.0000001)

        table.insert(images, spriteName)
    end

    setTextString('text1', 'Made by ZozerKul')
    setTextString('text2', 'Menu concept')
    screenCenter('text1', 'x')
    screenCenter('text2', 'x')
end

function onUpdate()
	setTextString('counter', currentIndex .. '/' .. #images)
	if keyJustPressed('back') then
		endSong()
	end
	if keyJustPressed('right') then
        playAnim('flecha1', 'select', true)
        changeImage(1)
    elseif keyJustPressed('left') then
        changeImage(-1)
        playAnim('flecha0', 'select', true)
    end

    if getProperty('flecha0.animation.finished') and getProperty('flecha0.animation.name') == 'select' then
        playAnim('flecha0', 'flecha')
    end
    if getProperty('flecha1.animation.finished') and getProperty('flecha1.animation.name') == 'select' then
        playAnim('flecha1', 'flecha')
    end
end

function getImagesFromFolder(folder)
    local images = directoryFileList(folder)
    local categorizedImages = {}

    for i = #images, 1, -1 do
        if not images[i]:match('%.png$') then
            table.remove(images, i)
        else
            local name = images[i]:gsub('%.%w+$', '')
            local prefix, num = name:match('^(%a)(%d+)%w*$')

            if prefix and num then
                local txtPath = 'images/gallery/img/' .. name .. '.txt'
                local fileContent = getTextFromFile(txtPath)
                local properties = parseProperties(fileContent)

                table.insert(categorizedImages, {
                    name = name,
                    prefix = prefix,
                    num = tonumber(num),
                    order = properties.order
                })
            end
        end
    end
    table.sort(categorizedImages, function(a, b)
        local prefixOrder = { M = 1, S = 2, O = 3, F = 4 }
    
        if prefixOrder[a.prefix] ~= prefixOrder[b.prefix] then
            return prefixOrder[a.prefix] < prefixOrder[b.prefix]
        elseif a.order ~= b.order then
            return a.order < b.order
        else
            if a.num ~= b.num then
                return a.num < b.num
            else
                return a.name < b.name
            end
        end
    end)

    images = {}
    for _, entry in ipairs(categorizedImages) do
        table.insert(images, entry.name)
    end

    return images
end

function changeImage(direction)
    local oldImage = images[currentIndex]
    
    doTweenAlpha('fadeOut' .. oldImage, oldImage, 0.0000001, 0.1, 'quartOut')

    currentIndex = currentIndex + direction
    if currentIndex > #images then
        currentIndex = 1
    elseif currentIndex < 1 then
        currentIndex = #images
    end

    local newImage = images[currentIndex]
    setProperty(newImage .. '.alpha', 0.0000001)

    local imageWidth = getProperty(newImage .. '.width')
    local centerX = 640 - imageWidth / 2
    local offset = 300

    local startX = direction > 0 and (centerX + offset) or (centerX - offset)
    setProperty(newImage .. '.x', startX)

    doTweenX('imageTween', newImage, centerX, 0.3, 'quartOut')

    doTweenAlpha('fadeIn' .. newImage, newImage, 1, 0.1, 'quartOut')

    local properties = imageData[newImage]
    if properties then
        setTextString('text1', properties.text1)
        setTextString('text2', properties.text2)
        screenCenter('text1', 'x')
        screenCenter('text2', 'x')
    end
end

function parseProperties(content)
    local props = {}

    local text1, text2, order, scale, antialiasing = content:match('([^,]+),%s*([^,]+),?%s*([^,]*),?%s*([^,]*),?%s*([^,]*)')

    props.text1 = text1
    props.text2 = text2
    props.order = (order and order ~= '') and tonumber(order) or 9999
    props.scale = (scale and scale ~= '') and tonumber(scale) or 1
    props.antialiasing = (antialiasing == 'true') or (antialiasing == '')

    return props
end

function applyImageProperties(spriteName, properties)
    setTextString('text1', properties.text1)
    setTextString('text2', properties.text2)
    setProperty(spriteName .. '.scale.x', properties.scale)
    setProperty(spriteName .. '.scale.y', properties.scale)
    setProperty(spriteName .. '.antialiasing', properties.antialiasing)
end

function onEndSong()
    playMusic('freakyMenu', 1, true)
    runHaxeCode([[
    import backend.MusicBeatState;
    MusicBeatState.switchState(new states.MainMenuState());
    ]])
    return Function_Stop
end

function onStartCountdown()
	return Function_Stop
end

function onPause()
	return Function_Stop
end

function onGameOver()
	return Function_Stop
end