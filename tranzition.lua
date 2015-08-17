-- Copyright 2015 Daniele Molinari www.danielemolinari.it
--
-- Corona SDK Tranzition Library
--
-- Usage: local tranzition = require("tranzition")

module(..., package.seeall)

-- Usage: object = object involved in rotation, time = time in millis for a 360 degree rotation (period), fps of the app

rotate = function (object, time, fps)
    if (object.rotation >= 360) then
        object.rotation = 0
    end
    time = 4000 / (1000/fps)
    object.rotation = object.rotation + 360/time
end

-- Usage: object = object involved in rotation, newX = target x, newY = target y, speed = speed of the movement (8 is a good value), fps of the app

moveTo = function(object, newX, newY, speed, fps)
    if (object.x ~= newX) or (object.y ~= newY)  then
        local spaceX = math.abs(object.x - newX)
        local spaceY = math.abs(object.y - newY)
        local calculatedTime = (( spaceX + spaceY ) * speed) / (1000/fps)

        local moveX = false
        local moveY = false

        if not moveX then
            if object.x > newX then
                object.x = object.x - spaceX/calculatedTime
                if object.x <= newX then
                    moveX = true
                end
            else
                object.x = object.x + spaceX/calculatedTime
                if object.x >= newX then
                    moveX = true
                end
            end
        end
        if not moveY then
            if object.y > newY then
                object.y = object.y - spaceY/calculatedTime
                if object.y <= newY then
                    moveY = true
                end
            else
                object.y = object.y + spaceY/calculatedTime
                if object.y >= newY then
                    moveY = true
                end
            end
        end
        if (moveY and moveX) then
            object.x = newX
            object.y = newY
        end
    end
end
