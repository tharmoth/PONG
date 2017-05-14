--! file: shape.lua
Shape = Object:extend()

function Shape:new(x, y, speedx, speedy)
    self.x = x
    self.y = y
    self.speedx = speedx
    self.speedy = speedy
end
function Shape:update(dt)
    self.x = self.x + self.speedx * dt
    self.y = self.y + self.speedy * dt
end