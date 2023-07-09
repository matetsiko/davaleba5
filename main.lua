push = require "push"

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243


state = "menu"


player_x = 70
player_y = 80
player2_x = 300
player2_y = 80

function love.load()
    love.graphics.setFont(love.graphics.newFont("8-bit-pusab.ttf", 16))
    love.graphics.setDefaultFilter("nearest", "nearest")
    push:setupScreen(
        VIRTUAL_WIDTH,
        VIRTUAL_HEIGHT,
        WINDOW_WIDTH,
        WINDOW_HEIGHT,
        {
            fullscreen = false,
            resizable = true,
            vsync = true
        }
    )
end

function love.keypressed(key)
  if key == "return" then
      state = "game"
  end
    
  if (state == "game")then
    if key == "p" then
        state = "pause"
      end
  end
end




function love.update(dt)
    if (state == "game")then
      if love.keyboard.isDown("w") then
          player_y = player_y - 5
      end

      if love.keyboard.isDown("s") then
          player_y = player_y + 5
      end
        if love.keyboard.isDown("a") then
          player_x = player_x - 5
      end

      if love.keyboard.isDown("d") then
            player_x = player_x + 5
      end


      if love.keyboard.isDown("down") then
          player2_y = player2_y + 5
      end

      if love.keyboard.isDown("up") then
          player2_y = player2_y - 5
      end
        
      if love.keyboard.isDown("left") then
          player2_x = player2_x - 5
      end

      if love.keyboard.isDown("right") then
          player2_x = player2_x + 5
      end
      
      
      while (player_x >= 413)do
        player_x = 412
      end

      while (player_x <= -1)do
        player_x = 0
      end
      
      while (player_y >= 224)do
        player_y = 223
      end
      
      while (player_y <= -1)do
        player_y = 0
      end
      
      
      
      while (player2_x >= 413)do
        player2_x = 412
      end

      while (player2_x <= -1)do
        player2_x = 0
      end
      
      while (player2_y >= 224)do
        player2_y = 223
      end
      
      while (player2_y <= -1)do
        player2_y = 0
      end




    end
end

function love.draw()
    push:start()

    love.graphics.clear(5/255, 5/255, 5/255, 255/255)
    love.graphics.rectangle("fill", player_x, player_y, 20, 20)
    love.graphics.rectangle("fill", player2_x, player2_y, 20, 20)
    
    
    
    push:apply("end")
    if (state == "menu")then
        love.graphics.print("welcome to my game", 460, 150)
    end
    if (state == "pause")then
        love.graphics.print("paused", 538, 150)
    end
end





--1260  700