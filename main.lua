-- Copyright 2018 Sadkit


local inertia = require("inertia")

local picture = display.newRect( 50, 50, 150, 50 )
picture.strokeWidth = 3
picture:setFillColor( 0.5 )
picture:setStrokeColor( 1, 0, 0 )

local function onNewFrame()
    inertia.moveTo(picture, 200, 400, 4, 60)
    inertia.rotate(picture, 4000, 60)
end

Runtime:addEventListener("enterFrame", onNewFrame)
