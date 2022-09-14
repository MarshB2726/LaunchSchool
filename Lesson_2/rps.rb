VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

WIN_LOSE = [['rock', 'scissors'], ['rock', 'lizard'],
            ['paper', 'rock'], ['paper', 'spock'],
            ['scissors', 'paper'], ['scissors', 'lizard'],
            ['spock', 'scissors'], ['spock', 'rock'],
            ['lizard', 'paper'], ['lizard', 'spock']]

def prompt(message)
  puts("=>  #{message}")
end

def display_results(player, computer)
  if WIN_LOSE.include?([player, computer])
    prompt("You won!")
  elsif WIN_LOSE.include?([computer, player])
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

p_score = 0
cpu_score = 0

game_start = <<MSG
You are playing Rock, Paper, Scissor, Spock, Lizard!
This game is first to 3 points wins.
Lets get started!
MSG

prompt(game_start)

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = ['rock', 'paper', 'scissors', 'spock', 'lizard'].sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  if WIN_LOSE.include?([choice, computer_choice])
    p_score += 1
  elsif WIN_LOSE.include?([computer_choice, choice])
    cpu_score += 1
  end

  prompt("Current score is You: #{p_score} vs Computer: #{cpu_score}")
  break if p_score == 3 || cpu_score == 3
end

if p_score == 3
  prompt("You've bested the Bot!")
elsif cpu_score == 3
  prompt("The CPU has bested you!")
end

prompt("Thank you for playing!")
