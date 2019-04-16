local _originalHeight = nil
local _originalWidth = nil
local _lastWidth = nil
local _lastHeight = nil

resolution = {
    -- default values
    ratio = nil,
    width = nil,
    height = nil,
}

function resolution:init(width, height)
    _originalWidth = width
    _originalHeight = height
    resolution.ratio = {width/height, height/width}
    resolution.width = _originalWidth
    resolution.height = _originalHeight
    _lastWidth = _originalWidth
    _lastHeight = _originalHeight
end

function resolution:set()
    local _newWidth = love.graphics.getWidth()
    local _newHeight = love.graphics.getHeight()
    if _lastWidth ~= _newHeight then
        self.width = math.floor(love.graphics.getWidth())
        self.height = math.floor(love.graphics.getWidth()*(self.ratio[2]))
    elseif _lastHeight ~= _newHeight then
        self.width = math.floor(love.graphics.getHeight()*(self.ratio[1]))
        self.height = math.floor(love.graphics.getHeight())
    end

    if not love.window.getFullscreen() then
        love.window.setMode(self.width, self.height, {resizable=true})
    end
end
