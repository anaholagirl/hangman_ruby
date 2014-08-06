class Game

  def initialize
    @letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    new_word = Word.new
    @random_word_for_game = new_word.choose_word.split("")
    @correct_guesses = []
    @used_letters = []
    @picture = 0
    @loop = true
  end

  def letters
    @letters
  end

  def loop_change
    @loop = false
  end

  def game_win
    @correct_guesses.each do |letter|
      @found_underscore = false
      if letter == "_"
        @found_underscore = true
      end
    end
    if (@found_underscore == false) && ((correct_guesses <=> random_word) == 0)
      @loop = false
    end

  end

  def game_lose
    if @picture == 6
      @loop = false
    end
  end

  def underscore_array
    @random_word_for_game.length.times do
      correct_guesses << "_"
    end
  end

  def random_word
    @random_word_for_game
  end

  def correct_guesses
    @correct_guesses
  end

  def used_letters
    @used_letters
  end

  def picture
    @picture
  end

  def loop
    @loop
  end

  def add_one_to_picture
    @picture += 1
  end
# test_game.letter_choice('a')
# expect(test_game.correct_letters).to eq ['a', '_', '_']
  def letter_choice(letter_choice)
    @letters.each do |letter|
      if letter_choice == letter
        @letters.delete(letter)

        count = 0
        @random_word.each do |correct_letter|
          count += 1
          if letter_choice == correct_letter
            @correct_guesses[count -1] = letter_choice
          end
        end
      end
    end
  end


  def picture_array
    @picture_array = ['''

  +---+
  |   |
      |
      |
      |
      |
=========''', '''

  +---+
  |   |
  O   |
      |
      |
      |
=========''', '''

  +---+
  |   |
  O   |
  |   |
      |
      |
=========''', '''

  +---+
  |   |
  O   |
 /|   |
      |
      |
=========''', '''

  +---+
  |   |
  O   |
 /|\  |
      |
      |
=========''', '''

  +---+
  |   |
  O   |
 /|\  |
 /    |
      |
=========''', '''

  +---+
  |   |
  O   |
 /|\  |
 / \  |
      |
=========''']
  end

end
