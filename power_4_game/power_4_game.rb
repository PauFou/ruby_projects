
def game_board()
  round = 0
  victory = 0
  board = {
    A:[1, 2, 3, 4, 5, 6, 7, 8],
    "1": ["*", "*", "*", "*", "*", "*", "*", "*"],
    "2": ["*", "*", "*", "*", "*", "*", "*", "*"],
    "3": ["*", "*", "*", "*", "*", "*", "*", "*"],
    "4": ["*", "*", "*", "*", "*", "*", "*", "*"],
    "5": ["*", "*", "*", "*", "*", "*", "*", "*"],
    "6": ["*", "*", "*", "*", "*", "*", "*", "*"],
    "7": ["*", "*", "*", "*", "*", "*", "*", "*"]
  }
  puts "Welcome!"
  puts ''
  puts ""
  puts ""
  puts "Now, let's start the game"
  count = 0

  while victory == 0
    round += 1
    puts ""
    puts ""
    puts ""
    board.each{ |k, v| puts v.join(" ") }
    puts ''
    puts "Please choose a column [ex: 2]"
    index = gets.chomp
    index = index.to_i - 1
    base = 7
    while base > -1
      if base == 0
        puts ''
        puts "You can't play there, the column is full"
        puts ''
        break
      end
      puts index
      puts ""
      puts ""
      puts ""
      puts board[:"#{base.to_s}"][index]
      if board[:"#{base.to_s}"][index] == "*"
        board[:"#{base.to_s}"][index] = "0"
        board.each{ |k, v| puts v.join(" ") }
        break;
      else
        base -= 1
      end
    end
    adv_played = false
    puts 'the opponent is thinking ....'
    sleep(5)
    while adv_played == false
      adv_base = 7
      adv = rand(0..7)
      while adv_base > 0
        if board[:"#{base.to_s}"][adv] == "*"
          board[:"#{base.to_s}"][adv] = "X"
          board.each{ |k, v| puts v.join(" ") }
          adv_played = true
        else
          adv_base -= 1
        end
      end
    end
  end
end

game_board()
