Comida = Classe:extend()

function Comida:new()
    self.posicao = self:geraPosicao()
    self.cor = {0, 1, 1}
end

function Comida:draw()
    love.graphics.setColor(self.cor)
    love.graphics.rectangle("fill", self.posicao.x, self.posicao.y, 18, 18)
end

function Comida:geraPosicao()
    local x = math.random(0, LARGURA_TELA - 18)
    local y = math.random(0, ALTURA_TELA - 18)
    return Vetor(x, y)
end