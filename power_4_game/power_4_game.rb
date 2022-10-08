
def victory?(game_board, symbol)
  count = 0
  # per row
  game_board.each do |k, v|
    v.each do |el|
      el == symbol ? count += 1 : count = 0
      return true if count == 4
    end
  end
  count = 0
  # per column
  for i in (0..7)
    game_board.each do |k, v|
      v[i] == symbol ? count += 1 : count = 0
      return true if count == 4
    end
  end

  playground_right = Marshal.load(Marshal.dump(game_board))
  # the hard part, diago on the right
  for i in (1..7)
    i.times do
      playground_right[:"#{i}"].unshift("*")
    end
  end
  for i in (0..7)
    playground_right.each do |k, v|
      v[i] == symbol ? count += 1 : count = 0
      return true if count == 4
    end
  end
  # the hard part, diago on the left
  playground_left = Marshal.load(Marshal.dump(game_board))
  try = 7
  for i in (1..7)
    try.times do
      playground_left[:"#{i}"].unshift("*")
    end
    try -= 1
  end
  for i in (0..7)
    playground_left.each do |k, v|
      v[i] == symbol ? count += 1 : count = 0
      return true if count == 4
    end
  end
  return false
end


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
    if victory?(board, "X")
      puts 'winner is X'
      break
    end
    adv_played = false
    puts ''
    puts ''
    puts 'the opponent is thinking ....'
    puts ''
    puts ''
    sleep(0.5)
    while adv_played == false
      adv_base = 7
      adv = rand(0..7)
      while adv_base > 0
        if board[:"#{adv_base.to_s}"][adv] == "*"
          board[:"#{adv_base.to_s}"][adv] = "X"
          board.each{ |k, v| puts v.join(" ") }
          adv_played = true
          adv_base = 0
        else
          adv_base -= 1
        end
      end
    end
    if victory?(board, "0")
      puts ''
      puts ''
      puts 'winner is 0'
      break
    elsif round == 56
      puts ''
      puts ''
      puts 'square'
      break
    end
  end
end

game_board()
