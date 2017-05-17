Menu = Object:extend()

function Menu:new()
    self.timer = timer
    self.area = Area()
    
    --!Build Board
    self.area:addGameObject('Score',400-150,80,{name = 'P', scoreCount = 'P'})
    self.area:addGameObject('Score',400-70,80,{name = 'O'})
    self.area:addGameObject('Score',400+10,80,{name = 'N', scoreCount = 'N'})
    self.area:addGameObject('Score',400+90,80,{name = 'G', scoreCount = 'G'})
    
    self.area:addGameObject('Rectangle',0,0,{width = 800, height = 20, name = 'topBoarder'})
    self.area:addGameObject('Rectangle',0,580,{width = 800, height = 20, name = 'bottomBoarder'})
    self.area:addGameObject('Rectangle',0,0,{width = 20, height = 600, name = 'leftBoarder'})
    self.area:addGameObject('Rectangle',780,0,{width = 20, height = 600, name = 'rightBoarder'})
    
    self.area:addGameObject('Text',400,240,{words = 'Single Player', name = 'SinglePlayer', center = true})
    self.area:addGameObject('Text',400,300,{words = 'Multiplayer', name = 'Multiplayer', center = true})
    self.area:addGameObject('Text',400,360,{words = 'Settings', name = 'Settings', center = true})
    --!{240,300,360}
    self.area:addGameObject('MenuScroll',0,0,{locations = {'SinglePlayer','Multiplayer','Settings'}, width = 150, height = 2, name = 'MenuScroll', center = true})
end
function Menu:update(dt)
    self.area:update(dt)
end

function Menu:draw()
    self.area:draw()
end