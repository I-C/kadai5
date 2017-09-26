# coding: utf-8
class Enemy < Sprite
  def update
    self.y += 3
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    self.vanish
  end
end
