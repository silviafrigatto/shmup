function draw_game()
     cls()

    --Draw starfield
    starfield()

    --Draw / animate the ship (bend left and right)
    if ship_sprite_left then
        spr(1,ship_x,ship_y)
    elseif ship_sprite_right then
        spr(3,ship_x,ship_y)
    else
        spr(ship_sprite_center,ship_x,ship_y)
    end

    --Draw bullet
    if shoot then
        spr(bullet_sprite,bullet_x,bullet_y)
    end

    --Draw flash
    if flash then
        circfill(ship_x + 3,ship_y - 3,flash_size,7)
        flash_size = flash_size - 1
    end

    --Draw trail
    spr(trail_sprite,ship_x,ship_y + 7)
    trail_sprite = trail_sprite + 1
    if trail_sprite == 9 then
        trail_sprite = 5
    end

    --Draw hearts
    lives = 4
    for i=1,4 do
        if lives >= i then
            spr(11,i * 9 - 8,heart_y)
        else
            spr(12,i * 9 - 8,heart_y)
        end

    end

    print("score: "..score,40,1,12)
end

function draw_start_menu()
    cls(1)
    print("my awesome shmup", 30, 40, 12)
    print("press any key to start", 30, 70, 7)
end