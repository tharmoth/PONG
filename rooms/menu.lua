Menu = Object:extend()

function Menu:new()
    self.timer = timer
    self.area = Area()
    
    --!Build Board
    self.area:addGameObject('Score',      400-150, 80,  {name = 'P',             scoreCount = 'P' })
    self.area:addGameObject('Score',      400-70,  80,  {name = 'O'                               })
    self.area:addGameObject('Score',      400+10,  80,  {name = 'N',             scoreCount = 'N' })
    self.area:addGameObject('Score',      400+90,  80,  {name = 'G',             scoreCount = 'G' })
    self.area:addGameObject('Rectangle',  0,       0,   {name = 'topBoarder',    width = 800, height = 20  })
    self.area:addGameObject('Rectangle',  0,       580, {name = 'bottomBoarder', width = 800, height = 20  })
    self.area:addGameObject('Rectangle',  0,       0,   {name = 'leftBoarder',   width = 20,  height = 600 })
    self.area:addGameObject('Rectangle',  780,     0,   {name = 'rightBoarder',  width = 20,  height = 600 })
    self.area:addGameObject('Text',       400,     240, {name = 'SinglePlayer',  words = 'Single Player', center = true })
    self.area:addGameObject('Text',       400,     300, {name = 'Multiplayer',   words = 'Multiplayer',   center = true })
    self.area:addGameObject('Text',       400,     360, {name = 'Settings',      words = 'Settings',      center = true })
    self.area:addGameObject('MenuScroll', 0,       0,   {name = 'MenuScroll',    locations = {'SinglePlayer','Multiplayer','Settings'}})
end
function Menu:update(dt)
    self.area:update(dt)
end

function Menu:draw()
    self.area:draw()
end
