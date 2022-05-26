require_relative './manager'

def menu
  manager = Manager.new
  loop do
    puts " Cryptocurrency Converter ".center(50, "#")
    puts "a) Convert to USD"
    puts "b) Convert to EUR"
    puts "q) Quit"
    puts "Action: "
    choice = gets.chomp

    case choice
    when 'a'
      coin_list = manager.coin_list
      puts "Available Coins"
      puts coin_list.join(", ").center(50, "-")

    end



    break unless choice != 'q'
  end

end

menu()