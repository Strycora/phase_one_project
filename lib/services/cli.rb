class Cli

    def start
        Api.load_data
        main_menu_options

    end

    def main_menu_options
        puts "  "
        puts "Enter 1 in order to get 10 random jokes!"
        puts "Any other entry will exit the program."
        puts "  "
        main_menu

    end

    def main_menu
        input = get_input_one
        puts "  "
        if input == "1"
           Jokes.all.each_with_index do |joke, index|
            puts "#{index+1}. #{joke.setup}"
        
            end
            sub_menu
        else
            puts "Exiting program..."
            puts "  "
        end
    end

    def sub_menu
        puts "  "
        puts "Select the number of the joke you want to hear the punchline to"
        input = get_input_two
        puts "  "
        if input == "1" || input == "2" || input == "3" || input == "4" || input == "5" || input == "6" || input == "7" || input == "8" || input == "9" || input == "10"
            index = input.to_i - 1 
                    joke = Jokes.all[index]
                        puts "Punchline: "
                        puts "#{joke.punchline}"
                            Jokes.clear
        else 
            puts "Invalid Input"
            Jokes.clear
        end
        start
    end

    def get_input_one
        print "Enter Choice (1): "
        gets.chomp
    end

    def get_input_two
        print "Enter Choice (1-10): "
        gets.chomp
    end
    
end
