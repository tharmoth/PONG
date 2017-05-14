Player = Rectangle:extend()

function Player:new(x, y, width, height, upkey, downkey)
    Player.super.new(self, x, y, width, height, 0, 0)
    self.upKey = upkey
    self.downKey = downkey
    self.score = 0
end
function Player:keyPressed(key)
    --If the spacebar is pressed
    if key == self.upKey then
      self.speedy = self.speedy - 500
    elseif key == self.downKey then
      self.speedy = self.speedy + 500
    end
end
function Player:keyReleased(key)
    --If the spacebar is pressed
    if key == self.upKey then
      self.speedy = self.speedy + 500
    elseif key == self.downKey then
      self.speedy = self.speedy - 500
    end
end
function Player:update(dt)
    self.y = self.y + self.speedy * dt

   
   local window_height = love.graphics.getHeight()
   if self.y < 20 then
     self.y = 20
   elseif self.y  > window_height - 20 - self.height then
     self.y = window_height - 20 - self.height
   end
end