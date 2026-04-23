function _init()
    cls()

    mode = "menu"
    lives = 4 
    score = 10000

    --Ship (player) variables
    ship = {x = 64, y = 64, speed = 2, sprite = 2}

    --Bullet variables
    bullets = {}    
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
    stars = {}
    for i=1, 100 do
        local new_star = {x = flr(rnd(128)), y = flr(rnd(128)), speed = rnd(1.5) + 0.5}
        add(stars,new_star)
    end

    --Enemies
    enemies = {}
    enemy = {x = rnd(120), y = -8, sprite = 21, spawn = false}
    add(enemies, enemy)
    

end

function _update()
    if mode == "game" then
        update_game()
    elseif mode == "menu" then
        update_main_menu()
    elseif mode == "over" then
        update_over()
    end
end

function _draw()
    if mode == "game" then
        draw_game()
    elseif mode == "menu" then
        draw_main_menu()
    else
        draw_over()
    end
end


