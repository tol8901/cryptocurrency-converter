require './manager'

def menu
  manager = Manager.new
  loop do
    puts " Cryptcurrency Converter ".center(50, "#")
    puts "a) Convert to USD"
    puts "b) Convert to EUR"
    puts "q) Quit"
    puts "Action: "
    choice = gets.chomp

    break unless choice != 'q'
  end

end

menu()