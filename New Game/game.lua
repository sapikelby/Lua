game = {}

function game.load()
	-- background init
	game.clock = 0

	-- enemy init
	game.enemy_size = imgs["enemy"]:getWidth()
	game.enemies = {}
	game.enemy_dt = 0
	game.enemy_rate = 2
end

function game.draw()
	-- draw moving background
	for i=0,4 do
		for j=1,6 do
			love.graphics.draw(imgs["background"], i*32*scale, (j+game.clock%1)*32*scale, 0,scale, scale)
		end
	end

	-- draw enemies 
	for _,v in ipairs(game.enemies) do
		love.graphics.draw(imgs["enemy"], v.x,v.y, 0, scale, scale, game.enemy_size/2, game.enemy_size/2)

		if debug then love.graphics.circle("line", v.x, v.y, game.enemy_size/2*scale)
		end
	end
end

function game.update(dt)
	-- clock for background
	game.clock = game.clock + dt 

	-- update game.enemies
	game.enemy_dt = game.enemy_dt + dt

	-- Enemy spawn
	if game.enemy_dt > game.enemy_rate then
		game.enemy_dt = game.enemy_dt - game.enemy_rate
		game.enemy_rate = game.enemy_rate - 0.01 * game.enemy_rate
		-- local is the actual enemy object
		local enemy = {}
		enemy.x = math.random((8)*scale, (160-8)*scale)
		enemy.y = -game.enemy_size
		table.insert(game.enemies, enemy)
	end

	-- update enemy
	for ei,ev in ipairs(game.enemies) do
		ev.y = ev.y + 10*dt*scale
		if ev.y > 144*scale then -- remove enemy if it falls below player
			table.remove(game.enemies,ei)
		end
	end
end

function game.keypressed(dt)
	-- change to game state, and init game
	--state = "game"
end