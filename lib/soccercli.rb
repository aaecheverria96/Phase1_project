class CLI 
attr_reader :scraper 


STANDINGS_ID = {
    "French Ligue 1" => "/FRA.1/french-ligue-1", 
    "English Premier League" => "/ENG.1/english-premier-league", 
    "German Bundesliga" => "/GER.1/german-bundesliga", 
    "Spanish Primera División" => "/ESP.1/spanish-primera-division", 
    "Italian Serie A" => "/ITA.1/italian-serie-a"
}
    def run
        @done = false
        welcome
        
        while !@done
            display_leagues
            user_selection
            input_validation 
            teams
            ask_done 
            reset 
        end
        goodbye 
    end 

    def welcome 
        puts "Hi! Please choose a league"
        @scraper = Scraper.new 
        scraper.get_leagues 
    end 

    def ask_done
        puts "Done? y / n" 
        done_input = gets.strip.downcase 
        
        while done_input != "y" && done_input != "n"
            puts "Sorry, didn't understand that. Please type y or n"
            done_input = gets.strip
        end
        
        @done = done_input == "n" ? false : true 
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
       else 
        puts "Wrong input, must be between 1 and #{League.show_all.length}"
        user_selection 
        input_validation  
       end
    end  

    def teams 
        league = League.show_all[@input.to_i - 1]
       @scraper.get_teams("https://www.espn.com/soccer/league/_/name#{STANDINGS_ID[league.name]}", league)  
       puts "League: #{league.name}" 
       puts league.display_teams 
       

       #teams_by_league.each_with_index do |team, index| 
        #puts "#{index + 1}. #{team.name}, Wins: #{team.wins}, Losses: #{team.losses}, Draws: #{team.draws}, Points: #{team.points}"
       
    end 

    def reset 
        system("clear")
    end 

    def goodbye 
        system("clear")
        puts "Thank you for visiting! Hope to see you soon!"
    end 
end