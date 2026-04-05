function _init()
    cls()

    score = 10000
    lives = 3

    --Ship (player) variables
    ship_sprite_center = 2
    ship_speed = 2
    ship_x = 64
    ship_y = 64

    --Bullet variables
    bullet_sprite = 16
    bullet_speed = 4
    bullet_x = 0
    bullet_y = 0
    shoot = false

    --Trail variables
    trail_sprite = 5

    --Flash variables
    flash_size = 0
    flash = false

    --Hearts variables
    --heart_x = 1
    heart_y = 1

    --Stars 
    star_x={}
    star_y={}
    for i=1,100 do
        add(star_x,flr(rnd(128)))
        add(star_y,flr(rnd(128)))
    end   
        
end

function _update()
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

function _draw()
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
    for i=1,3 do
        spr(11,i * 9,heart_y)
    end

    print("score: "..score,40,1,12)

end

function starfield()
    for i=1,#star_x do
        pset(star_x[i],star_y[i],7)
    end
end

function animateStars()
    star_speed = 1
    for i=1,#star_y do
        local sy = star_y[i]
        sy = sy + star_speed

        if sy > 128 then
            sy = sy - 128
        end
        star_y[i] = sy
    end
end
