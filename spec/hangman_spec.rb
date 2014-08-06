require "rspec"
require "words"
require "current"

describe "Word" do
  describe "initialize" do
    it "will create an instance of the Words class" do
      new_words = Word.new
      expect(new_words).to be_an_instance_of Word
    end
  end
end

describe "Game" do
  describe "initialize" do
    it 'creates a random word for the game' do
      allow_any_instance_of(Word).to receive(:rand).and_return(0)
      new_game = Game.new
      expect(new_game.random_word).to eq ['a', 'n', 't']
    end
  end

  describe "letter_choice" do
    it 'replaces blanks in correct letters array with correctly guessed letters' do
      allow_any_instance_of(Word).to receive(:rand).and_return(0)
      test_game = Game.new
      test_game.underscore_array
      test_game.letter_choice('a')
      expect(test_game.correct_letters).to eq ['a', '_', '_']
    end

    it 'increases picture count by one if the guess is incorrect' do
      allow_any_instance_of(Word).to receive(:rand).and_return(0)
      test_game = Game.new
      test_game.underscore_array
      test_game.letter_choice('b')
      expect(test_game.picture).to eq 1
    end
  end
end
