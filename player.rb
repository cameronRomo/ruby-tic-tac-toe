class Player
  ROW_MAP = (:A..:C).zip(0..2).to_h
  TRANSLATIONS = {
    row: ->(input) { ROW_MAP[input[0].upcase.to_sym] },
    column: ->(input) { input.to_i - 1 }
  }

  attr_reader :marker

  def initialize name, marker
    @name = name
    @marker = marker
    @score = 0
  end

  def get_move
    [get_coordinate(:row), get_coordinate(:column)]
  end

  def prompt_choice string
    puts "Pick a #{string}"
    print "> "
  end

  def get_coordinate row_or_column
    loop do
      prompt_choice row_or_column
      input = gets
      choice = TRANSLATIONS[row_or_column].call(input)
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