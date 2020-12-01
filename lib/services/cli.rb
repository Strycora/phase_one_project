class Cli

    def start
        puts "Welcome to the Joke app!"
        
        puts "loading.."
        Api.load_data
        #binding.pry
        main_menu_options

    end

    def main_menu_options
        puts "Enter 1 to get 10 random jokes!"
        puts "Any other entry will exit the program."
        main_menu

    end

    def main_menu
        input = get_input
        #binding.pry
        if input == "1"
           Jokes.all.each_with_index do |joke, index|
            puts "#{index+1}. #{joke.setup}"
        
            end
            sub_menu
            #binding.pry
        else
            return "Exiting program..."
        end
    end

    def sub_menu
        puts "Select a joke that you want to hear the punchline to"
        input = get_input
        index = input.to_i - 1 
        joke = Jokes.all[index]
        #binding.pry
            puts "#{joke.punchline}!"
        
        main_menu_options
    end

    def get_input
        print "Enter Choice: "
        gets.chomp
    end
end
