function update_game()
    ship_sprite_left = false
        ship_sprite_right = false
        animateStars()

        --Move the ship (left, right, up and down)
        if btn(0) then
            ship.x -= ship.speed
            ship_sprite_left = true
        elseif btn(1) then
            ship.x += ship.speed
            ship_sprite_right = true
        elseif btn(2) then
            ship.y -= ship.speed
        elseif btn(3) then
            ship.y += ship.speed
        end 

        --Move enemy
        for i=1, #enemies do
            enemy = enemies[i]
            enemy.y += 0.8
            --Animate enemy
            enemy.sprite += 1
            if enemy.sprite == 25 then 
                enemy.sprite = 21
            end
        end

        --Shoot / move the bullet
        --[[
        if btnp(5) then
            bullet_x = ship.x
            bullet_y = ship.y - 5
            bullet_shoot = true
            flash = true
            flash_size = 4
            sfx(0)
        end
        ]]

        if btnp(5) then
            local new_bullet={}
            new_bullet.x = ship.x
            new_bullet.y = ship.y - 3
            add(bullets,new_bullet)
            bullet_shoot = true
            flash = true
            flash_size = 4
            sfx(0)
        end
        
        for i=1, #bullets do
            local mybullet = bullets[i]
            mybullet.y = mybullet.y - 4
        end

        --Limit the edges of the game screen
        if ship.x > 120 then
            ship.x = 120
        elseif ship.x < 0 then
            ship.x = 0
        end
end

function update_start()
    if btnp(4) then
        mode = "game"
    end
end

function update_over() --TO FIX why is this not working?
    if lives == 0 then
        mode = "over"
    end
end