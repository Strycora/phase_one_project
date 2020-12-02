class Cli

    def start
        main_menu_options
    end

    def main_menu_options
        puts "  "
        puts "Enter 1 in order to get '10 random jokes'"
        puts "Enter 2 in order to get jokes by 'Type'"
        puts "Any other entry will exit the program."
        puts "  "
        main_menu
    end

    def main_menu
        input = get_input_one
        puts "  "
        if input == "1"
           Api.load_ten_jokes
            Jokes.all.each_with_index do |joke, index|
                puts "#{index+1}. #{joke.setup}"
            end
            sub_menu
        elsif input == "2"          
            puts "Enter 3 for 'general jokes'"
            puts "Enter 4 for 'knock-knock jokes'"
            puts "Enter 5 for 'programming jokes'"
            puts " "
            input_type = get_input_type
                if input_type == "3"
                    Api.load_general_jokes
                    Jokes.all.each_with_index do |joke, index|
                        puts "#{index+1}. #{joke.setup}"
                    end
                    sub_menu
                elsif input_type == "4"
                    Api.load_knockknock_jokes
                    Jokes.all.each_with_index do |joke, index|
                        puts "#{index+1}. #{joke.setup}"
                    end
                    sub_menu_knock
                elsif input_type == "5"
                    Api.load_programming_jokes
                    Jokes.all.each_with_index do |joke, index|
                        puts "#{index+1}. #{joke.setup}"
                    end
                    sub_menu
                else
                    puts "Invalid Input - returning to Main Menu"
                    main_menu
                end
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
            puts "Invalid Input - returning to Main Menu"
            Jokes.clear
        end
        start
    end

    def sub_menu_knock
        puts "  "
        puts "Select the number of the joke you want to hear the punchline to"
        input = get_input_knock
        puts "  "
        if input == "1" || input == "2" || input == "3" || input == "4" || input == "5" 
            index = input.to_i - 1 
                    joke = Jokes.all[index]
                        puts "Punchline: "
                        puts "#{joke.punchline}"
                            Jokes.clear
        else 
            puts "Invalid Input - returning to Main Menu"
            Jokes.clear
        end
        start
    end

    def get_input_one
        print "Enter Choice (1 or 2): "
        gets.chomp
    end

    def get_input_two
        print "Enter Choice (1-10): "
        gets.chomp
    end

    def get_input_type
        print "Enter Choice (3-5): "
        gets.chomp
    end

    def get_input_knock
        print "Enter Choice (1-5): "
        gets.chomp
    end
end
