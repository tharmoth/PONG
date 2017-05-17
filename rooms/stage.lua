Stage = Object:extend()

function Stage:new()
    self.timer = timer
    self.area = Area()
    
    --!Build Board
    self.area:addGameObject('Score', 310, 40, {name = 'player1Score'})
    self.area:addGameObject('Score', 430, 40, {name = 'player2Score'})
    self.area:addGameObject('Rectangle', 0,   0,   {width = 800, height = 20,  name = 'topBoarder'   })
    self.area:addGameObject('Rectangle', 0,   580, {width = 800, height = 20,  name = 'bottomBoarder'})
    self.area:addGameObject('Rectangle', -80, 0,   {width = 80,  height = 600, name = 'leftBoarder'  })
    self.area:addGameObject('Rectangle', 800, 0,   {width = 80,  height = 600, name = 'rightBoarder' })
    self.area:addGameObject('Player', 10,  0,   {width = 20, height = 80, playerNumber = 'one', upKey = 'w',  downKey = 's',    name = 'player1'})    
    self.area:addGameObject('Player', 770, 300, {width = 20, height = 80, playerNumber = 'two', upKey = 'up', downKey = 'down', name = 'player2'})
    self.area:addGameObject('Ball', 390, 300, {width = 20, height = 20, name = 'ball'})
    --! Build center deviding line
    for i=10,600,40 do
      self.area:addGameObject('Rectangle',390,i,{width = 20, height = 20, name = 'boxLineAt'..i})
    end
end
function Stage:update(dt)
    self.area:update(dt)
end

function Stage:draw()
    self.area:draw()
end
