-- Functions called by framework
function love.load()
	hero = {} -- new table for the hero
	hero.x = 300 -- x,y coordinates for the hero
	hero.y = 540
	hero.speed = 100
end

-- dt is delta time
-- variables are not of a fixed type
function love.update(dt)
	-- love.keyboard function allows easy access to keyboard
	if love.keyboard.isDown("left") then
		hero.x = hero.x - hero.speed*dt
	elseif love.keyboard.isDown("right") then
			hero.x = hero.x + hero.speed*dt 
	end

end


function love.draw()
	-- draw the ground 
	-----------------------R-G---B-Alpha
	love.graphics.setColor(0,255,0,255)
	love.graphics.rectangle("fill", 0, 465,800, 150)
	--love.graphics.print("Hello World", 400, 300)

	-- draw the hero
	love.graphics.setColor(255,255,0,255)
	-- 30 and 15 are the height and width of rectangle
	love.graphics.rectangle("fill", hero.x, hero.y, 30,15)
end 

