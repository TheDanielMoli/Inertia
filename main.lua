-- Copyright 2015 Daniele Molinari www.danielemolinari.it


local tranzition = require("tranzition")

local picture = display.newRect( 50, 50, 150, 50 )
picture.strokeWidth = 3
picture:setFillColor( 0.5 )
picture:setStrokeColor( 1, 0, 0 )

local function onNewFrame()
    tranzition.moveTo(picture, 200, 400, 4, 60)
    tranzition.rotate(picture, 4000, 60)
end

Runtime:addEventListener("enterFrame", onNewFrame)
