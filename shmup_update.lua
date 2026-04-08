function update_game()
    ship_sprite_left = false
        ship_sprite_right = false
        animateStars()

        --Move the ship (left, right, up and down)
        if btn(0) then
            ship_x = ship_x - ship_speed
            ship_sprite_left = true
        elseif btn(1) then
            ship_x = ship_x + ship_speed
            ship_sprite_right = true
        elseif btn(2) then
            ship_y = ship_y - ship_speed
        elseif btn(3) then
            ship_y = ship_y + ship_speed
        end 

        --Shoot / move the bullet
        if btnp(5) then
            bullet_x = ship_x
            bullet_y = ship_y - 5
            shoot = true
            flash = true
            flash_size = 4
            sfx(0)
        end
        
        bullet_y = bullet_y - bullet_speed

        --Limit the edges of the game screen
        if ship_x > 120 then
            ship_x = 120
        elseif ship_x < 0 then
            ship_x = 0
        end
end

function update_start()
    if btnp(4) then
        mode = "game"
    end
end