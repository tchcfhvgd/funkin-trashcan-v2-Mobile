function onCreate()
    precacheImage('stages/jojo/ojos clima')
    precacheSound('anasui muriendo')

    makeLuaText('text', "You... The kind of evil that doesn't even realize it's evil...", 0, 0, 525)
    setTextFont('text', 'manga.ttf')
    setTextSize('text', 26)
    screenCenter('text', 'x')

    makeAnimatedLuaSprite('mangabujo 1', 'stages/jojo/mangabujo 1', 0, -595)
    addAnimationByPrefix('mangabujo 1', 'mangabujo 1', 'mangabujoprimeroprimerito', 24, false)
    setObjectCamera('mangabujo 1', 'hud')
    screenCenter('mangabujo 1', 'x')
    setObjectOrder('mangabujo 1', 11)

    makeAnimatedLuaSprite('marcobujo', 'stages/jojo/marcobujo', 0, -595)
    addAnimationByPrefix('marcobujo', 'marcobujo', 'marcobujo', 24, true)
    setObjectCamera('marcobujo', 'hud')
    screenCenter('marcobujo', 'x')
    setObjectOrder('marcobujo', 12)

    makeAnimatedLuaSprite('pucci rayo gay', 'stages/jojo/pucci rayo gay', 1290, 35)
    addAnimationByPrefix('pucci rayo gay', 'pucci rayo gay', 'pucci rayo gay', 24, true)
    setObjectCamera('pucci rayo gay', 'hud')
    scaleObject('pucci rayo gay', 0.9, 0.9)
    setObjectOrder('pucci rayo gay', 13)

    makeAnimatedLuaSprite('anasui caracol', 'stages/jojo/anasui caracol', 1290, 145)
    addAnimationByPrefix('anasui caracol', 'anasui caracol', 'anasui muerte', 24, true)
    setObjectCamera('anasui caracol', 'hud')
    scaleObject('anasui caracol', 0.7, 0.7)
    setObjectOrder('anasui caracol', 14)

    makeAnimatedLuaSprite('weather pierna', 'stages/jojo/weather pierna', -640, 145)
    addAnimationByPrefix('weather pierna', 'weather pierna', 'weather pierna', 24, true)
    setObjectCamera('weather pierna', 'hud')
    scaleObject('weather pierna', 0.7, 0.7)
    setObjectOrder('weather pierna', 15)

    makeAnimatedLuaSprite('wezaripoto', 'stages/jojo/wezaripoto', -540, 0)
    addAnimationByPrefix('wezaripoto', 'wezaripoto', 'wezaripoto', 24, true)
    setObjectCamera('wezaripoto', 'hud')
    screenCenter('wezaripoto', 'y')
    setProperty('wezaripoto.flipX', true)
    setObjectOrder('wezaripoto', 16)
end

function onSongStart()
    doTweenY('mangabujo 1', 'mangabujo 1', 64.5, 2, 'CubeOut')
    doTweenY('marcobujo', 'marcobujo', 64.5, 2, 'CubeOut')
end

function onStepHit()
    if curStep == 128 then
        playSound('anasui muriendo', 1, 'anasui muriendo')

        doTweenX('pucci rayo gay', 'pucci rayo gay', 800, 1, 'CubeOut')
    end

    if curStep == 142 then
        doTweenX('anasui caracol', 'anasui caracol', 650.6, 1, 'CubeOut')
    end

    if curStep == 176 then
        doTweenX('weather pierna', 'weather pierna', 26.4, 1, 'CubeOut')
    end

    if curStep == 226 then
        doTweenX('wezaripoto', 'wezaripoto', 100, 1, 'CubeOut')
    end

    if curStep > 1438 and curStep < 1536 then
        setProperty('vocals.volume', 1)
    end

    if curStep == 1442 then
        makeAnimatedLuaSprite('ojos wolsom', 'stages/jojo/ojos clima', 1290, 240)
        addAnimationByPrefix('ojos wolsom', 'ojos wolsom', 'ojos wolsom', 24, false)
        addAnimationByPrefix('ojos wolsom', 'ojitos2', 'ojitos2', 24, true)
        addLuaSprite('ojos wolsom', false)
        setObjectCamera('ojos wolsom', 'hud')

        doTweenX('ojos wolsom', 'ojos wolsom', 750, 1, 'CubeOut')

        addLuaText('text')
    end

    if curStep == 1510 then
        playAnim('ojos wolsom', 'ojitos2')

        setTextString('text', 'is the worst one there is!')
        screenCenter('text', 'x')
    end

    if curStep == 1536 then
        doTweenX('ojos wolsom bye', 'ojos wolsom', 1290, 1, 'CubeOut')

        setProperty('text.alpha', 0)
    end

    if curStep > 1790 and curStep < 1836 then
        setProperty('vocals.volume', 1)
    end

    if curStep == 1792 then
        doTweenX('wezaripoto', 'wezaripoto', 750, 1, 'CubeOut')

        setTextString('text', 'Weather Report!')
        screenCenter('text', 'x')
        setProperty('text.alpha', 1)
    end

    if curStep == 1812 then
        setTextString('text', "Don't you dare touch me!")
        screenCenter('text', 'x')
    end

    if curStep == 1836 then
        removeLuaText('text')
    end
end

function onBeatHit()
	if curBeat % 2 == 0 then
        playAnim('mangabujo 1', 'mangabujo 1', false, false, 0)
	end
end

function onCountdownTick(counter)
	if counter % 2 == 0 then
	    playAnim('mangabujo 1', 'mangabujo 1', false, false, 0)
    end
end

function onTweenCompleted(tag)
    if tag == 'ojos wolsom bye' then
        removeLuaSprite('ojos wolsom')
    end
end

function onPause()
    pauseSound('anasui muriendo')
end

function onResume()
    resumeSound('anasui muriendo')
end