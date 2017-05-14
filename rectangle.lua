--! file: rectangle.lua
Rectangle = Shape:extend()

function Rectangle:new(x, y, width, height, speedx, speedy)
    Rectangle.super.new(self, x, y, speedx, speedy)
    self.width = width
    self.height = height
end
function Rectangle:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end