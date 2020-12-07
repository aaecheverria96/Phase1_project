class CLI 
attr_reader :scraper 
    def run 
        welcome 
        display_leagues
        user_selection
        input_validation
    end 

    def welcome 
        puts "Hi! Please choose a league"
        @scraper = Scraper.new 
        scraper.get_leagues 
    end 

    def display_leagues 
        League.show_all.each.with_index(1) {|league, i| puts "#{i}. #{league.name}"}
    end

    def user_selection 
        puts "Please select the corresponding number"
        @input = gets.strip 
    end 

    def input_validation 
       index = @input.to_i-1 
       if index.between?(0, League.show_all.length - 1) 
       league =  League.show_all[index]
       scraper.get_league_info 
       else 
        puts "Wrong input, must be between 1 and #{League.show_all.length}"
        user_selection 
        input_validation  

       end
    end 

    


end 