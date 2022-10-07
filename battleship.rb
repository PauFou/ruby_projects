def board_game()
  board = {
    A: ["*", "*", "0", "*", "*", "*", "*", "*", "*",],
    B: ["*", "*", "0", "*", "*", "0", "0", "0", "0",],
    C: ["*", "*", "0", "*", "*", "*", "*", "*", "*",],
    D: ["*", "*", "*", "*", "*", "*", "*", "*", "*",],
    E: ["*", "0", "0", "0", "0", "*", "*", "*", "*",],
    F: ["*", "*", "*", "*", "*", "*", "*", "0", "*",],
    G: ["*", "*", "*", "*", "*", "*", "*", "0", "*",],
    H: ["*", "0", "*", "*", "0", "*", "*", "0", "*",],
    I: ["*", "0", "*", "*", "0", "*", "*", "*", "*",],
    J: ["*", "*", "*", "*", "*", "*", "*", "*", "*",]
  }
end

def game()
  board = board_game()
  round = 0
  victoire = false
  game = {
    V: [1, 2, 3, 4, 5, 6, 7, 8, 9],
    A: ["*", "*", "*", "*", "*", "*", "*", "*", "*"],
    B: ["*", "*", "*", "*", "*", "*", "*", "*", "*"],
    C: ["*", "*", "*", "*", "*", "*", "*", "*", "*"],
    D: ["*", "*", "*", "*", "*", "*", "*", "*", "*"],
    E: ["*", "*", "*", "*", "*", "*", "*", "*", "*"],
    F: ["*", "*", "*", "*", "*", "*", "*", "*", "*"],
    G: ["*", "*", "*", "*", "*", "*", "*", "*", "*"],
    H: ["*", "*", "*", "*", "*", "*", "*", "*", "*"],
    I: ["*", "*", "*", "*", "*", "*", "*", "*", "*"],
    J: ["*", "*", "*", "*", "*", "*", "*", "*", "*"]
  }
  puts "Welcome!"
  puts ''
  puts "As a reminder, there are 6 ship to kill during the game"
  puts ""
  puts "Now, let's start the game"
  count = 0

  while victoire == false
    round += 1
    puts "round number #{round}"
    game.each{ |k, v| puts "#{k} - #{v.join(" ")}" }
    puts ''
    puts "Please choose a place to shoot [ex: E1]"
    shoot = gets.chomp
    shoot = shoot.chars
    key = shoot[0].to_sym
    indice_value = shoot[1].to_i - 1
    if board[key][indice_value] == "0"
      puts ""
      puts ""
      puts "Touché!"
      game[key][indice_value] = "X"
      board[key][indice_value] == "*"
      count += 1
    else
      puts ""
      puts ""
      puts "plouffff!"
    end
    if count == 18
      puts 'Victory !!!!!'
      puts ""
      puts "You just won in #{round} rounds"
      victoire = true
    else
      puts ""
      puts ""
    end
  end
end

game()
