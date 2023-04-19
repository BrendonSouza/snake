Jogo = Classe:extend()

function Jogo:new()
    cobra = Cobra()
    pontos = 0
    comidaCont = 0
    comida = Comida()

    
end

function Jogo:update(dt)
    cobra:update(dt)
    if comidaCont == 0 then
        comida = Comida()
        comidaCont = 1
    end
    if comidaCont>0 then
        self:detectarColisao()
    end
end

function Jogo:draw()
    cobra:draw()
    if comidaCont > 0 then
        comida:draw()
    end

    love.graphics.print("Pontos: " .. pontos, 10, 10)
    love.graphics.print("posicao x cobra: " .. cobra.posicao.x, 10, 30)
    love.graphics.print("posicao y cobra: " .. cobra.posicao.y, 10, 50)
    love.graphics.print("posicao x comida: " .. comida.posicao.x, 10, 70)
    love.graphics.print("posicao y comida: " .. comida.posicao.y, 10, 90)
    
   
end

function Jogo:detectarColisao()
    if cobra.posicao.x < comida.posicao.x + 18 and
    cobra.posicao.x + 10 > comida.posicao.x and
    cobra.posicao.y < comida.posicao.y + 18 and
    cobra.posicao.y + 10 > comida.posicao.y then
        comidaCont = 0
        pontos = pontos + 1
        cobra.tamanho = cobra.tamanho + 1
 end
end