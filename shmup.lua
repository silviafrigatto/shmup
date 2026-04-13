function _init()
    cls()

    score = 10000

    --Ship (player) variables
    ship_sprite_center = 2
    ship_speed = 2
    ship_x = 64
    ship_y = 64

    --Bullet variables
    bullet_sprite = 16
    bullet_speed = 4
    --bullet_x = 0
    --bullet_y = 0
    bullet_shoot = false

    --bullet = {sprite = 16, speed = 4, x = 0, y = 0, shoot = false, bullets = []}

    --Trail variables
    trail_sprite = 5

    --Flash variables
    flash_size = 0
    flash = false

    --Hearts variables
    --heart_x = 1
    heart_y = 1

    --Stars 

    --[[ OLD CODE
    star_x={}
    star_y={}
    star_speed={}

    for i=1,100 do
        add(star_x,flr(rnd(128)))
        add(star_y,flr(rnd(128)))
        add(star_speed,rnd(1.5) + 0.5)
    end   
    ]]--

    
    lives = 4 -- TO FIX

    stars = {}
    for i=1,100 do
        local new_star = {}
            new_star.x = flr(rnd(128))
            new_star.y = flr(rnd(128))
            new_star.speed = rnd(1.5) + 0.5
            add(stars,new_star)
    end

    bullets = {}

    mode = "start"

end

function _update()
    if mode == "game" then
        update_game()
    elseif mode == "start" then
        update_start()
    elseif mode == "over" then
        update_over()
    end
end

function _draw()
    if mode == "game" then
        draw_game()
    elseif mode == "start" then
        draw_start_menu()
    else
        draw_over()
    end
end


