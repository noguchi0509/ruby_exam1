class Player
  def hand
    puts "数字を入力してください\n0:グー\n1:チョキ\n2:パー"
    player_hand = gets.to_i
    if player_hand > 2
      puts " 0〜2の数字を入力してください。"
      self.hand
    else
      return player_hand
    end
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する  
    @enemy_hand =rand(0..2)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    case enemy_hand
    when 0
      enemy_hand_words = "グー"
    when 1
      enemy_hand_words = "チョキ"
    when 2
      enemy_hand_words = "パー"
    end
    
    result = (player_hand - enemy_hand+3)%3
    case result
    when 0
      puts "相手の手は#{enemy_hand_words}です。おあいこです。"
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new
      self.pon(player.hand, enemy.hand)
    when 1
      puts "相手の手は#{enemy_hand_words}です。あなたの負けです。"
    when 2
      puts "相手の手は#{enemy_hand_words}です。あなたの勝ちです。"
    end
      
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)