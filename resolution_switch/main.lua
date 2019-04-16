debug = true

require("math")
require("resolution")

function love.load(arg)
    background = love.graphics.newImage("testbild_16_9.png")
    resolution:init(love.graphics.getWidth(),love.graphics.getHeight())
end

function love.resize(w, h)
    resolution:set()
end

function love.update(dt)
    if love.keyboard.isDown("f") then
        love.window.setFullscreen(true)
    end

    if not love.window.getFullscreen() and love.keyboard.isDown("escape") then
        love.window.close()
    elseif love.keyboard.isDown("escape") then
        love.window.setFullscreen(false)
    end

end

function love.draw()
    -- love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),love.graphics.getHeight())

    love.graphics.push()
    -- love.graphics.scale(resolution.scalex, resolution.scaley)
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("fill",0,0,resolution.width,resolution.height)
    -- love.graphics.draw(background)
    love.graphics.pop()

    love.graphics.setColor(255,255,255)
    love.graphics.print(resolution.width..":"..resolution.height,5,5)
end