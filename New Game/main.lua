debug = false
require('splash')
require('game')

function love.load()
	-- Load images (global assets)
	img_fn =  {"bullet", "enemy", "player", "title", "background"}
	imgs = {}
	for _,v in ipairs(img_fn) do
		imgs[v] = love.graphics.newImage("Assets/"..v..".gif")
	end

	-- set filter to nearest
	for _,v in ipairs(imgs) do
		v:setFilter("nearest", "nearest")
	end

	-- all this functions: newSource, newFont, newImage are heavy on the processor so you 
	-- don't want them in the draw function or any other place besides love.load (try to minimize them)

	-- Play music and loop it
	music = love.audio.newSource("Assets/music.ogg", "stream") -- stream b/c file may be big
	music:setLooping(true)
	love.audio.play(music)

	-- load shoot sound
	shoot = love.audio.newSource("Assets/shoot.ogg", "static") -- static because it's short so load it straight into memory

	-- initialize font and set it
	font = love.graphics.newFont("Assets/font.ttf", 14*scale)
	love.graphics.setFont(font)

	-- define colors (global assets)
	bgcolor = {r=148,g=191, b=19}
	fontcolor = {r=46,g=115,b=46}

	-- initial state
	state = "splash"
	-- load the splash
	splash.load()
	game.load()

end

function love.draw()
	-- set color
	love.graphics.setColor(bgcolor.r, bgcolor.g, bgcolor.b)

	-- draw rectangle for the background
	love.graphics.rectangle("fill", 0,0, love.graphics.getWidth(), love.graphics.getHeight())

	-- return the color back to normal
	love.graphics.setColor(255,255,255)

	-- call the state's draw function
	if state == "splash" then
		splash.draw()
	elseif state == "game" then
		game.draw()
	end

end

function love.update(dt)
	-- Call the state's update function
	if state == "splash" then
		splash.update(dt)
	elseif state == "game" then
		game.update(dt)
	end

end

function love.keypressed(key)
	if state == "splash" then
		splash.keypressed(key)
	elseif state == "game" then
		game.keypressed(key)	
	end

	if key == "`" then
		debug = not debug
	end

end