--! MenuScroll.lua
--! This file underlines the objects whose names are passed in locations
MenuScroll = Rectangle:extend()
--! Uses (area, N/A, N/A, {locations{names of items to be underlined}, height, upKey, downKey, name})
function MenuScroll:new(area, x, y, opts)
    MenuScroll.super.new(self, area, 0, 0, opts)
    self.height = height or 2
    self.upKey = self.upKey or "w",
    self.downKey = self.downKey or "s"
    input:bind(self.upKey, self.upKey)
    input:bind(self.downKey, self.downKey)
    --! Underline the first object
    self.currentLocation = 1    
    self:underline(self.locations[self.currentLocation])
end
function MenuScroll:update(dt)
    self:playerInput()
    MenuScroll.super.update(self, dt)
end
function MenuScroll:playerInput()
    if input:pressed(self.upKey) then 
      self:nextLocation()
    end
    if input:pressed(self.downKey) then 
      self:priorLocation()
    end
end
function MenuScroll:nextLocation()
    if self.currentLocation == 1 then
      self.currentLocation = #self.locations
    else
      self.currentLocation = self.currentLocation - 1
    end
    self:underline(self.locations[self.currentLocation])
end
function MenuScroll:priorLocation()
    if #self.locations == self.currentLocation then
      self.currentLocation = 1
    else
      self.currentLocation = self.currentLocation + 1
    end
    self:underline(self.locations[self.currentLocation])
end
function MenuScroll:draw()
    MenuScroll.super.draw(self)
end
function MenuScroll:underline(object)
    local currentObject = self.area:getIndex(object)
    self.x = self.area.game_objects[currentObject].x
    self.y = self.area.game_objects[currentObject].y + self.area.game_objects[currentObject].height
    self.width = self.area.game_objects[currentObject].width
end
