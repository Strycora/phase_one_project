class Cli

    def start
        main_menu_options
    end

    def main_menu_options
        puts "  "
        puts "Enter 1 in order to get '10 random jokes'"
        puts "Enter 2 in order to get jokes by 'Type'"
        puts "Or type 'exit' to exit the program."
        puts "  "
        main_menu
    end

    def main_menu
        input = get_input("1 or 2")
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
            input_type = get_input("3-5")
                if input_type == "3"
                    Api.load_jokes("general")
                    Jokes.all.each_with_index do |joke, index|
                        puts "#{index+1}. #{joke.setup}"
                    end
                    sub_menu
                elsif input_type == "4"
                    Api.load_jokes("knock-knock")
                    Jokes.all.each_with_index do |joke, index|
                        puts "#{index+1}. #{joke.setup}"
                    end
                    sub_menu_knock
                elsif input_type == "5"
                    Api.load_jokes("programming")
                    Jokes.all.each_with_index do |joke, index|
                        puts "#{index+1}. #{joke.setup}"
                    end
                    sub_menu
                else
                    puts "Invalid Input - returning to Main Menu"
                    main_menu
                end
        elsif input == "exit"
            puts "Exiting program..."
            puts "  "

        else
            puts "Invalid Input - returning to Main Menu"
            puts "   "
            start
        end
    end

    def sub_menu
        puts "  "
        puts "Select the number of the joke you want to hear the punchline to"
        input = get_input("1-10")
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
        input = get_input("1-5")
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

    def get_input(choice)
        print "Enter Choice #{choice}: "
        gets.chomp
    end
end
