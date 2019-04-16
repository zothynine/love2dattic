local _originalHeight = nil
local _originalWidth = nil
local _lastWidth = nil
local _lastHeight = nil
local _maxWidth = nil
local _maxHeight = nil

resolution = {
    -- default values
    ratio = nil,
    width = nil,
    height = nil,
}

function resolution:setWindow(_width, _height)
    if not love.window.getFullscreen() then
        love.window.setMode(_width, _height, {resizable=true})
    end
end

function resolution:init()
    local _width, _height = love.window.getDesktopDimensions()

    _maxWidth = math.floor((_width/100)*80)
    _maxHeight = math.floor((_height/100)*80)
    _originalWidth = _maxWidth
    _originalHeight = _maxHeight
    -- first value horizontal first, second value vertical first
    resolution.ratio = {_originalWidth/_originalHeight, _originalHeight/_originalWidth}
    resolution.width = _originalWidth
    resolution.height = _originalHeight
    _lastWidth = _originalWidth
    _lastHeight = _originalHeight
    self.width = _originalWidth
    self.height = _originalHeight

    resolution:setWindow(self.width, self.height)
end

function resolution:set()
    local _newWidth = love.graphics.getWidth()
    local _newHeight = love.graphics.getHeight()

    -- if _newWidth > _maxWidth then
    --     _newWidth = _maxWidth
    -- end

    -- if _newHeight > _maxHeight then
    --     _newHeight = _maxHeight
    -- end


    if _lastWidth ~= _newWidth then
        self.width = love.graphics.getWidth()
        self.height = math.floor(love.graphics.getWidth()*(self.ratio[2]))
    elseif _lastHeight ~= _newHeight then
        self.width = math.floor(love.graphics.getHeight()*(self.ratio[1]))
        self.height = math.floor(love.graphics.getHeight())
    end

    resolution:setWindow(self.width, self.height)
end
