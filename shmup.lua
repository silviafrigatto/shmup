function _init()
    cls()
    --Ship (player) variables
    ship_sprite=1
    ship_speed=2
    ship_x=64
    ship_y=64
end

function _update()
    --Move the ship (left, right, up and down)
    if btn(0) then
        ship_x=ship_x-ship_speed
    elseif btn(1) then
        ship_x=ship_x+ship_speed
    elseif btn(2) then
        ship_y=ship_y-ship_speed
    elseif btn(3) then
        ship_y=ship_y+ship_speed
    end    
end

function _draw()
    --Draw the ship
    cls()
    spr(ship_sprite,ship_x,ship_y)
end

