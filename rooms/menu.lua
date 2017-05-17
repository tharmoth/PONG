Menu = Object:extend()

function Menu:new()
    self.timer = timer
    self.area = Area()
    
    --!Build Board
    self.area:addGameObject('Score', 400-150, 80, {scoreCount = 'P', name = 'P'})
    self.area:addGameObject('Score', 400-70,  80, {                  name = 'O'})
    self.area:addGameObject('Score', 400+10,  80, {scoreCount = 'N', name = 'N'})
    self.area:addGameObject('Score', 400+90,  80, {scoreCount = 'G', name = 'G'})
    
    self.area:addGameObject('Rectangle', 0,   0,   {width = 800, height = 20,  name = 'topBoarder'   })
    self.area:addGameObject('Rectangle', 0,   580, {width = 800, height = 20,  name = 'bottomBoarder'})
    self.area:addGameObject('Rectangle', 0,   0,   {width = 20,  height = 600, name = 'leftBoarder'  })
    self.area:addGameObject('Rectangle', 780, 0,   {width = 20,  height = 600, name = 'rightBoarder' })
    
    self.area:addGameObject('Text', 400, 240, {words = 'Single Player', center = true, name = 'SinglePlayer'})
    self.area:addGameObject('Text', 400, 300, {words = 'Multiplayer',   center = true, name = 'Multiplayer' })
    self.area:addGameObject('Text', 400, 360, {words = 'Settings',      center = true, name = 'Settings'    })

    self.area:addGameObject('MenuScroll', 0, 0, {locations = {'SinglePlayer','Multiplayer','Settings'}, width = 150, height = 2, center = true, name = 'MenuScroll'})
end
function Menu:update(dt)
    self.area:update(dt)
end

function Menu:draw()
    self.area:draw()
end
