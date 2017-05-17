--! main.lua
--! This is my test function to test things
Object = require "libraries/classic/classic"
Input = require "libraries/BYTEPATH/Input"
Timer = require "libraries/BYTEPATH/enhancedTimer"
require "utils/utils"

function love.load()
   --! loads all the files in given folders
   loadfolder("objects")
   loadfolder("rooms")
   current_room = nil
   --! Initalize classes
   input = Input()
   timer = Timer()
   --! Load in music files (Might want to move this)
   topHit = love.audio.newSource("audioAssets/topHit.wav", "static")
   paddleHit = love.audio.newSource("audioAssets/paddleHit.wav", "static")
   wallHit = love.audio.newSource("audioAssets/wallHit.wav", "static")
   newFont = love.graphics.newFont("imgAssets/newFont.ttf",20)
   love.graphics.setFont(newFont)
   
   input:bind("return", function() gotoRoom("Stage") end)
   input:bind("2", function() gotoRoom("Menu") end)
   current_room = nil
   gotoRoom("Menu")
end
function love.update(dt)
    if current_room then current_room:update(dt) end
    timer:update(dt)
end
function love.draw()
    if current_room then current_room:draw() end
end
function gotoRoom(room_type, ...)
    current_room = _G[room_type](...)
end
