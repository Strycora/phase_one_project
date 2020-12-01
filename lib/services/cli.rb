class Cli

    def start
        Api.load_data
        main_menu_options

    end

    def main_menu_options
        puts "Enter 1 to get 10 random jokes!"
        puts "Any other entry will exit the program."
        main_menu

    end

    def main_menu
        input = get_input
        if input == "1"
           Jokes.all.each_with_index do |joke, index|
            puts "#{index+1}. #{joke.setup}"
        
            end
            sub_menu
        else
            return "Exiting program..."
        end
    end

    def sub_menu
        puts "Select a joke that you want to hear the punchline to"
        input = get_input
        if input == "1" || input == "2" || input == "3" || input == "4" || input == "5" || input == "6" || input == "7" || input == "8" || input == "9" || input == "10"
            index = input.to_i - 1 
                    joke = Jokes.all[index]
                        puts "#{joke.punchline}"
                        Jokes.clear
        else 
            puts "Invalid Input"
            Jokes.clear
        end
        start
    end

    def get_input
        print "Enter Choice: "
        gets.chomp
    end
end
