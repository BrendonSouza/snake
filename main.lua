LARGURA_TELA, ALTURA_TELA = love.graphics.getDimensions()

function love.load()
    Classe = require "libs/classic"
    Vetor = require "libs/vetor"

    require "jogo"
    require "cobra"
    require "comida"
    jogo = Jogo()
    cobra = Cobra()

end


function love.update(dt)
    jogo:update(dt)
end

function love.draw()
    jogo:draw()
end