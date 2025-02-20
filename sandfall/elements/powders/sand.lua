
-- Sand
sand = {

    -- Element properties
    properties = {
        name  = "sand", -- Name
        colour = {r = 1, g = 0.9, b = 0.5, a = 1}, -- RGBA colour (Red, Green, Blue, Alpha/Transparency)
        noise = true, -- Whether or not to add noise to the texture (Grainy effect)
        check = true, -- Whether or not the cell gets checked (You probably want this as true)
        density = 1, -- Density of the element (Check other elements to see what it will sink in)
        corrosive_res = 0.2, -- Resistance to corrosion (If higher than a materials corrosion, it won't corrode)
        -- Corrosiveness = 0 -- How likely the element is to corrode other elements
        integrity = 0.3 -- Integrity of the element (How often it crumbles)
    },
    
    -- Sand update
    update = function(cell)

        -- Logic for element, specifically powder
        if down and cell.element.properties.density > down.element.properties.density and not down.checked then
            swapCells(cell, down) -- Falling
    
        elseif down_left and left and love.math.random(0, 100) > cell.element.properties.integrity * 100 and cell.isFalling and cell.element.properties.density > down_left.element.properties.density and cell.element.properties.density > left.element.properties.density then
            swapCells(cell, down_left) -- Diagonal left movement
    
        elseif down_right and right and love.math.random(0, 100) > cell.element.properties.integrity * 100 and cell.isFalling and cell.element.properties.density > down_right.element.properties.density and cell.element.properties.density > right.element.properties.density then
            swapCells(cell, down_right) -- Diagonal right movement
    
        end

    end,
    
}

return sand