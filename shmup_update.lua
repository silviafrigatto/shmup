function update_game()
    ship_sprite_left = false
    ship_sprite_right = false
    animateStars()
    trail_sprite = animateSprite(trail_sprite, 1, 10, 5)

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
    for enemy in all(enemies) do
        enemy.y += 0.8
        --Animate enemy
        enemy.sprite += 0.4
        if enemy.sprite >= 25 then
            enemy.sprite = 21
        end
        --Delete enemy
        if enemy.y > 128 then
            del(enemies, enemy)
        end
    end

    --Shoot / move the bullet
    if btnp(5) then
        local new_bullet = {x = ship.x, y = ship.y - 3, sprite = 16, speed = 4}
        add(bullets, new_bullet)
        shoot = true
        flash = true
        flash_size = 4
        sfx(0)
    end

    for bullet in all(bullets) do
        bullet.y -= bullet.speed
        --Delete bullet
        if bullet.y < -8 then
            del(bullets, bullet)
        end
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

function update_over()
    --TO FIX why is this not working?
    if lives == 0 then
        mode = "over"
    end
end