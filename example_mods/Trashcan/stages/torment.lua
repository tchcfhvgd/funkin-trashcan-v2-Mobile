function onCreate()
    makeLuaSprite('nubes', 'stages/torment/nubes', -280, -490)
    addLuaSprite('nubes', false)
    setScrollFactor('nubes', 0.3, 1.0)

    makeLuaSprite('pared', 'stages/torment/Pared', -425, -400)
    addLuaSprite('pared', false)
    setScrollFactor('pared', 0.6, 1.0)

    makeAnimatedLuaSprite('fuego', 'stages/torment/fuego', 492, 235)
    addAnimationByPrefix('fuego', 'fueguito', 'firee', 24, true)
    addLuaSprite('fuego', false)
    setScrollFactor('fuego', 0.6, 1.0)

    makeAnimatedLuaSprite('fuego2', 'stages/torment/fuego', 1124, 235)
    addAnimationByPrefix('fuego2', 'fueguito', 'firee', 24, true)
    addLuaSprite('fuego2', false)
    setScrollFactor('fuego2', 0.6, 1.0)

    makeLuaSprite('plataformas', 'stages/torment/Plataformas', 90, -5)
    addLuaSprite('plataformas', false)
    setScrollFactor('plataformas', 0.95, 0.95)

    makeLuaSprite('piso', 'stages/torment/Piso', -340, 585)
    addLuaSprite('piso', false)
        
    close(true);
end