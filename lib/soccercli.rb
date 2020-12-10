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


STANDINGS_ID = [ 
    "German Bundesliga" => "GER.1/german-bundesliga", 
    "Uefa Champions League" => "UEFA.CHAMPIONS/uefa-champions-league", 
    "Major League Soccer" => "USA.1/major-league-soccer", 
    "English Premier League" => "ENG.1/english-premier-league", 
    "English FA Cup" => "ENG.FA/english-fa-cup", 
    "French Ligue 1"  => "FRA.1/french-ligue-1", 
    "Dutch Eredivise" => "NED.1/dutch-eredivisie", 
    "German DFB Pokal" => "GER.DFB_POKAL/german-dfb-pokal", 
    "Uefa European Championship Qualifying" => "UEFA.EUROQ/uefa-european-championship-qualifying"
]
    def run 
        welcome 
        display_leagues
        user_selection
        input_validation 
        options 
        user_selection 
       
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
      # scraper.get_league_info(league.url)
    #@scraper.get_league_scores("https://www.espn.com/soccer/fixtures/_/league/#{SCORES[league.name]}") 
       else 
        puts "Wrong input, must be between 1 and #{League.show_all.length}"
        user_selection 
        input_validation  
       end
    end  

    def options 
        puts "Please choose 1 for league standings or 2 for teams"
        @scraper = Scraper.new 
    end 

    def input_validation_two 

    end 


    def standings_or_team_rosters
        puts "Would you like to see standings or team rosters?"  
       @scraper.get_standings
       @scraper.get_standings("https://www.espn.com/soccer/league/_/name/#{STANDINGS_ID[league.name]}")   || @scraper.get_teams 
    end 
    


end 