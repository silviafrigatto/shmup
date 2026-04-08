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
    star_speed={}

    for i=1,100 do
        add(star_x,flr(rnd(128)))
        add(star_y,flr(rnd(128)))
        add(star_speed,rnd(1.5) + 0.5)
    end   

    mode = "game"
end

function _update()
    if mode == "game" then
        update_game()
    elseif mode == "start" then
        --do something else
    end
end

function _draw()
   if mode == "game" then
        draw_game()
    elseif mode == "start" then
        --do something else
    end
end


