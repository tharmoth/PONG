Player = Rectangle:extend()
function Player:new(area, x, y, opts)
    Player.super.new(self, area, x, y, opts)
    self.speedy = 0
    self.score = 0
    input:bind(self.upKey, self.upKey)
    input:bind(self.downKey, self.downKey)
end
function Player:update(dt)
    Player.super.update(self, dt)
    self:playerInput()
    self:stopCollision("bottomBoarder",topBounce)
    self:stopCollision("topBoarder",bottomBounce)
end
function Player:playerInput()
    if input:pressed(self.upKey) then 
      self.speedy = self.speedy - 500 
    end
    if input:released(self.upKey) then 
      self.speedy = self.speedy + 500 
    end
    if input:pressed(self.downKey) then 
      self.speedy = self.speedy + 500 
    end
    if input:released(self.downKey) then 
      self.speedy = self.speedy - 500 
    end
end
--! Checks if playyer intersects passed object if so does passed function
function Player:stopCollision(object,funct)
    local collisionObject = self.area:getIndex(object)
    if checkCollision(self.area.game_objects[collisionObject],self) then
      funct(self,collisionObject)
    end
end
--! Following bounce functions are passed to detectCollision to perfrom effects on the player when it bounces
function topBounce(self,collisionObject)
  self.y = self.area.game_objects[collisionObject].y-self.height
end
function bottomBounce(self,collisionObject)
  self.y = self.area.game_objects[collisionObject].y+self.area.game_objects[collisionObject].height
end
function Player:draw()
    Player.super.draw(self)
end