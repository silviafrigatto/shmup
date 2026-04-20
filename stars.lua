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

function animateSprite(frame, speed, last_pos, first_pos)
    frame += speed
    if frame >= last_pos then
        frame = first_pos
    end

    return frame
end