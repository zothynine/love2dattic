function love.load()
    ship = {}
    ship.img = love.graphics.newImage("ship.png")
    ship.x = 196
    ship.y = 116
    ship.r = 0
    ship.w = ship.img:getWidth()
    ship.h = ship.img:getHeight()
    ship.speed = 0
end

function love.update(dt)
    if love.keyboard.isDown("left") then
        ship.r = ship.r-1*dt
    elseif love.keyboard.isDown("right") then
        ship.r = ship.r+1*dt
    elseif love.keyboard.isDown("up") then
        ship.speed = math.min(ship.speed+1*dt, 3)
    elseif love.keyboard.isDown("down") then
        ship.speed = math.max(ship.speed-1*dt, 0)
    end

    ship.y = ship.y%240 - ship.speed
end

function love.draw()
    love.graphics.draw(ship.img, ship.x, ship.y, ship.r, 1, 1, ship.w/2, ship.h/2)
end
