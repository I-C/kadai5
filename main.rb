# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'

Window.width  = 800
Window.height = 600

player_img = Image.load("player.png")
player_img.setColorKey([255, 255, 255])

#分割読み込み
enemy_img = Image.load_tiles('enemys.png',2,1)
enemy_img[0].setColorKey([255, 0, 255])
enemy_img[1].setColorKey([255, 0, 255])
enemy_img_c = enemy_img[0]
player = Player.new(400, 500, player_img)

enemies = []
enemy_num = 0
time = 0
naki = 0



Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  #無限湧き
  if time%20 == 0 then
    enemies << Enemy.new(rand(800), rand(10), enemy_img_c)
      if time > 1000 then
        time = 0
      end
  end
  if enemy_img_c == enemy_img[1] then
    naki += 1
    if naki%500 == 0 then
      naki = 0
      enemy_img_c = enemy_img[0]
    end
  end

  time+=1
  Sprite.update(enemies)
  Sprite.draw(enemies)


  player.update
  player.draw
  # 当たり判定
  if Sprite.check(player, enemies)
    enemy_img_c= enemy_img[1]
  end

end
