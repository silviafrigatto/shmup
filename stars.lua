--stars = {}

function starfield()

    --[[
    for i=1,#star_x do
        local star_color = 6

        if star_speed[i] < 1 then
            star_color = 1
        elseif star_speed[i] < 1.5 then
            star_color = 13
        end
        pset(star_x[i],star_y[i],star_color) 
    end
    ]]--

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
    --[[
    for i=1,#star_y do
        local sy = star_y[i]
        sy = sy + star_speed[i]

        if sy > 128 then
            sy = sy - 128
        end
        star_y[i] = sy
    end
    ]]--

    for i=1, #stars do 
        local mystar = stars[i]
        mystar.y = mystar.y + mystar.speed
        if mystar.y > 128 then
            mystar.y = mystar.y - 128
        end
    end

end