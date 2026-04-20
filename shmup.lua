function _init()
    cls()

    mode = "start"
    lives = 4 -- TO FIX
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
    enemy = {x = 60, y = 5, sprite = 21}
    add(enemies, enemy)
    

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


