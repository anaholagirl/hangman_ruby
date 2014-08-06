require "./lib/words"
require "./lib/current"

def main_menu
  puts "would you like to play Hangman?  Press 'y' for yes or 'n' for no."
  play_game = gets.chomp
  if play_game == 'y'
    current_game
    while @new_game.loop == true do
      game_loop
      @new_game.game_win
      @new_game.game_lose
    end
  elsif play_game == 'n'
    exit
  end






  main_menu
end

def current_game
    @new_game = Game.new
    @new_game.underscore_array
    puts @new_game.picture_array[@new_game.picture]
    p @new_game.letters.join(" ")
    p @new_game.correct_guesses.join(" ")
  end

  def game_loop
  p @new_game.letters.join(" ")
  puts "Choose a letter from the list above."
  letter_choice = gets.chomp
  @new_game.letters.each do |letter|
    if letter_choice == letter
      @new_game.letters.delete(letter)

      count = 0
      number_of_correct_letters = 0
      @new_game.random_word.each do |correct_letter|
        if letter_choice == correct_letter
          @new_game.correct_guesses[count] = letter_choice
          @new_game.used_letters << letter_choice
          number_of_correct_letters += 1
        end
        count += 1
      end

      if number_of_correct_letters == 0
        @new_game.used_letters << letter_choice
        @new_game.add_one_to_picture
      end

          puts @new_game.picture_array[@new_game.picture]
          p @new_game.correct_guesses
          p @new_game.used_letters
    end
  end
    # @new_game.game_win
end
main_menu


