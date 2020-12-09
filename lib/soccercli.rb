class CLI 
attr_reader :scraper 
SCORES = {
    "German Bundesliga" => "GER.1/GER.1", 
    "Uefa Champions League" => "UEFA.CHAMPIONS/UEFA.CHAMPIONS", 
    "Major League Soccer" => "USA.1/USA.1", 
    "English Premier League" => "USA.1/USA.1", 
    "English FA Cup" => "ENG.FA/ENG.FA", 
    "French Ligue 1" => "FRA.1/FRA.1", 
    "Dutch Eredivise" => "NED.1/NED.1", 
    "German DFB Pokal" => "GER.DFB_POKAL/GER.DFB_POKAL", 
    "Uefa European Championship Qualifying" =>  "UEFA.EUROQ/UEFA.EUROQ"
    
}
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
       @scraper.get_standings
      # scraper.get_league_info(league.url)
       #scraper.get_league_scores("https://www.espn.com/soccer/fixtures/_/league/#{SCORES[league.name]}") 
       else 
        puts "Wrong input, must be between 1 and #{League.show_all.length}"
        user_selection 
        input_validation  
       end
    end 



    def choose_option_matches

    end  

    def choose_option_rosters 

    end 

    def choose_option_standings 

    end 

    


end 