function _init()
    cls()
    --Ship (player) variables
    ship_sprite_center = 2
    ship_speed = 2
    ship_x = 64
    ship_y = 64
end

function _update()

    ship_sprite_left = false
    ship_sprite_right = false

    --Move the ship (left, right, up and down)
    if btn(0) then
        ship_x = ship_x-ship_speed
        ship_sprite_left = true
    elseif btn(1) then
        ship_x = ship_x+ship_speed
        ship_sprite_right = true
    elseif btn(2) then
        ship_y = ship_y-ship_speed
    elseif btn(3) then
        ship_y = ship_y+ship_speed
    end 
    
    --Limit the edges of the game screen
    if ship_x > 120 then
        ship_x = 120
    elseif ship_x < 0 then
        ship_x = 0
    end
end

function _draw()
    --Draw the ship
    cls()
    spr(ship_sprite_center,ship_x,ship_y)
    
    --Animate the ship (bend left and right)
    if ship_sprite_left then
        spr(1,ship_x,ship_y)
    end
    if ship_sprite_right then
        spr(3,ship_x,ship_y)
    end
end

