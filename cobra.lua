Cobra = Classe:extend()

function Cobra:new()
    self.posicao = Vetor(LARGURA_TELA / 2, ALTURA_TELA / 2)
    self.velocidade = Vetor(0, 0)
    self.tamanho = 1
    self.corpo = {self.posicao}
    self.tempo = 0

end

function Cobra:update(dt)
    local posicaoAntiga = Vetor(self.posicao.x, self.posicao.y)

    self.posicao = self.posicao + self.velocidade * dt
    if self.posicao.x > LARGURA_TELA then
        self.posicao.x = 0
    elseif self.posicao.x < 0 then
        self.posicao.x = LARGURA_TELA
    end
    if self.posicao.y > ALTURA_TELA then
        self.posicao.y = 0
    elseif self.posicao.y < 0 then
        self.posicao.y = ALTURA_TELA
    end
    if love.keyboard.isDown("up") then
        self.velocidade = Vetor(0, -100)
    elseif love.keyboard.isDown("down") then
        self.velocidade = Vetor(0, 100)
    elseif love.keyboard.isDown("left") then
        self.velocidade = Vetor(-100, 0)
    elseif love.keyboard.isDown("right") then
        self.velocidade = Vetor(100, 0)
    end

   
    
        self.tempo = 0
       
            table.insert(self.corpo, 1, posicaoAntiga)
            if #self.corpo > self.tamanho then
                table.remove(self.corpo, #self.corpo)
            end

  
            self.crescer(self)

end

function Cobra:draw()
    love.graphics.setColor(1, 1, 1)
    for i, v in ipairs(self.corpo) do
      --a cabeça deve ter uma cor diferente do corpo e deve ser dado um espaço de 10 pixels entre a cabeça e o corpo
        if i == 1 then
            love.graphics.setColor(1, 0, 0)
        else
            love.graphics.setColor(1, 1, 1)
        end
        love.graphics.rectangle("fill", v.x, v.y, 10, 10)
    end
end


function Cobra:crescer()
    local novaParte = Vetor(self.posicao.x, self.posicao.y)
    table.insert(self.corpo, novaParte)

    -- adiciona a nova parte a uma distância fixa da última parte do corpo
    if #self.corpo > 1 then
        local ultimaParte = self.corpo[#self.corpo - 1]
        local distancia = 15  -- distância entre as partes do corpo
       
        novaParte = ultimaParte * distancia
        self.corpo[#self.corpo] = novaParte
    end

    if #self.corpo > self.tamanho then
        table.remove(self.corpo, #self.corpo)
    end

end
