--stars = {}

function starfield()
    for i=1,#star_x do
        local star_color = 6

        if star_speed[i] < 1 then
            star_color = 1
        elseif star_speed[i] < 1.5 then
            star_color = 13
        end
        pset(star_x[i],star_y[i],star_color) 
    end
end

function animateStars()
    for i=1,#star_y do
        local sy = star_y[i]
        sy = sy + star_speed[i]

        if sy > 128 then
            sy = sy - 128
        end
        star_y[i] = sy
    end
end