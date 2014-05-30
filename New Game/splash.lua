splash = {}

function splash.load()
	splash.dt_temp = 0
end

function splash.draw()
	love.graphics.draw(imgs["title"],0,(splash.dt_temp-1)*32*scale, 0, scale, scale)
	love.graphics.setColor(fontcolor.r, fontcolor.g, fontcolor.b)

	-- show after 2.5 seconds

	if splash.dt_temp == 2.5 then
		love.graphics.printf("Press Start", 0, 80*scale, love.graphics.getWidth(), "center")
	end

	-- reset the color
	love.graphics.setColor(255,255,255)
end

function splash.update(dt)
	-- update dt_temp
	splash.dt_temp = splash.dt_temp + dt

	-- wait 2.5 seconds, then stop in place (text)
	if splash.dt_temp > 2.5 then
		splash.dt_temp = 2.5
	end

end

function splash.keypressed(key)
	-- change to game state, and initialize game
	state = "game"

end