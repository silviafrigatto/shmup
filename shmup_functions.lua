--stars = {}

function starfield()
    for i=1, #stars do 
        local mystar = stars[i]
        local star_color = 6

        if mystar.speed < 1 then
            star_color = 1
        elseif mystar.speed < 1.5 then
            star_color = 13
        end
        pset(mystar.x,mystar.y,star_color)
    end
end

function animateStars()
    for i=1, #stars do 
        local mystar = stars[i]
        mystar.y = mystar.y + mystar.speed
        if mystar.y > 128 then
            mystar.y = mystar.y - 128
        end
    end
end

function animate(frame, speed, last_pos, first_pos)
    frame += speed
    if frame >= last_pos then
        frame = first_pos
    end

    return frame
end

function collision(a, b)
    local object_a = {left = a.x, right = a.x + 7, top = a.y, bottom = a.y + 7}
    local object_b = {left = b.x, right = b.x + 7, top = b.y, bottom = b.y + 7}

    if object_a.left > object_b.right then return false end
    if object_b.left > object_a.right then return false end
    if object_a.top > object_b.bottom then return false end
    if object_b.top > object_a.bottom then return false end

    return true
end

function spawnEnemy()
    enemies = {}
    enemy = {x = rnd(120), y = -8, sprite = 21, hp = 5}
    add(enemies, enemy)
end

