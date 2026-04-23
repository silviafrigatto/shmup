function draw_game()
     cls()

    --Draw starfield
    starfield()

    --Draw / animate the ship (bend left and right)
    if ship_sprite_left then
        spr(1, ship.x, ship.y)
    elseif ship_sprite_right then
        spr(3, ship.x, ship.y)
    else
        spr(ship.sprite, ship.x, ship.y)
    end

    --Draw enemies
    draw_sprites(enemies)

    --Draw bullet
    if shoot then
        draw_sprites(bullets)
    end

    --Draw flash
    if flash then
        circfill(ship.x + 3, ship.y - 3, flash_size, 7)
        flash_size -= 1
    end

    --Draw trail
    spr(trail_sprite, ship.x, ship.y + 7)
    
    --[[trail_sprite += 1
    if trail_sprite >= 9 then
        trail_sprite = 5
    end]]

    --Draw hearts
    for i=1,4 do
        if lives >= i then
            spr(11,i * 9 - 8, heart_y)
        else
            spr(12,i * 9 - 8, heart_y)
        end
    end

    print("score: "..score,40, 1, 12)
end

function draw_main_menu()
    cls(1)
    print("my awesome shmup", 30, 40, 12)
    print("press any key to start", 30, 70, 7)
end

function draw_over()
    cls(2)
    print("game over", 30, 40, 12)
    print("press any key to start", 30, 70, 7)
end

function draw_sprites(array)
    for object in all (array) do
        spr(object.sprite, object.x, object.y)
    end
end