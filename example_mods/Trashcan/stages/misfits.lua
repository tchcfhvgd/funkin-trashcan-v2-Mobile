function onCreate()
        makeLuaSprite('tiendas', 'stages/misfits/shop', -330, -130)
        addLuaSprite('tiendas', false)
        scaleObject('tiendas', 0.75, 0.75)
        setScrollFactor('tiendas', 0.7, 0.7)

        makeAnimatedLuaSprite('tanic', 'stages/misfits/tanic', 880, 100)
        addAnimationByPrefix('tanic', 'idle', 'tanic bumping', 24, false)
        addLuaSprite('tanic', false)
        scaleObject('tanic', 0.7, 0.7)

        makeLuaSprite('piso', 'stages/misfits/floor', -950, 580)
        addLuaSprite('piso', false)
        scaleObject('piso', 0.8, 0.9)

        makeLuaSprite('edificio', 'stages/misfits/building', -470, -200)
        addLuaSprite('edificio', false)
        scaleObject('edificio', 0.6, 0.6)

        makeLuaSprite('cantar', 'stages/misfits/sing', -500, 470)
        addLuaSprite('cantar', false)
        scaleObject('cantar', 0.6, 0.6)
        setProperty('cantar.flipX', true)
        
        makeLuaSprite('capa1', 'stages/misfits/Addlayer1', -340, -350)
        addLuaSprite('capa1', true)
        scaleObject('capa1', 0.6, 0.8)
        setBlendMode('capa1', 'add')

        makeLuaSprite('capa2', 'stages/misfits/multiplylayer', -470, -100)
        addLuaSprite('capa2', true)
        scaleObject('capa2', 0.8, 0.6)
        setBlendMode('capa2', 'multiply')
        
        makeLuaSprite('capa3', 'stages/misfits/multiplylayer2', -800, -500)
        addLuaSprite('capa3', true)
        setBlendMode('capa3', 'multiply')
        
end

function onBeatHit()
	if curBeat % 2 == 0 then
	        playAnim('tanic', 'idle', false, false, 0)
	end
end

function onCountdownTick(counter)
	if counter % 2 == 0 then
	    playAnim('tanic', 'idle', false, false, 0)
        end
end