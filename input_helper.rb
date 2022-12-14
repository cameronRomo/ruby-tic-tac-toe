module InputHelper
  SAFE_WORDS = ['QUIT', 'EXIT', 'GET ME OUT OF HERE!']

  def prompt string
    print string + "\n> "
  end

  def gets
    input = Kernel.gets
    if SAFE_WORDS.include?(input.chomp.strip.upcase)
      puts "User quit."
      puts "Goodbye."
      exit
    end
    input
  end
end
