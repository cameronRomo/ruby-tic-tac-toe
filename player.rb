class Player
  ROW_MAP = (:A..:C).zip(0..2).to_h
  TRANSLATIONS = {
    row: ->(input) { ROW_MAP[input[0].upcase.to_sym] },
    column: ->(input) { input.to_i - 1 }
  }

  attr_reader :marker, :name, :score

  def initialize name, marker
    @name = name
    @marker = marker
    @score = 0
  end

  def get_move
    TRANSLATIONS.map do |row_or_column, translator|
      get_coordinate row_or_column, translator
    end
  end

  def increment_score
    @score += 1
  end

  private
  def prompt_choice row_or_column
    print "Pick a #{row_or_column}\n>"
  end

  def get_coordinate row_or_column, translator
    loop do
      print prompt_choice row_or_column
      input = gets
      choice = translator.call(input)
      return choice if valid? choice
      puts "Invalid #{row_or_column}."
    end
  end

  def choice_prompt string
    puts "Pick a #{string}"
    print "> "
  end

  def valid? choice
    (0..2).include? choice
  end
end