require 'nokogiri' 
require 'open-uri'
require 'pry' 
require 'byebug'


class Scraper 

    def get_page 
        url = "https://www.espn.com/soccer/competitions" 
        html =  open('https://www.espn.com/soccer/competitions') 
        doc = Nokogiri::HTML(html) 
        league_names_container = doc.at_css('[id="topCompetitions"]').next_element.children.first.children.children ## get top div for league names
        league_names = []
        
        league_names_container.each do |league|
            league_names << league.text.strip
        end

        return league_names
      end 

    def get_teams 

    end   

    def make_teams

    end 

    def get_players_by_team 

    end  

    def make_player

    end 

    def get_leagues 

    end 

    def make_league 

    end 

    def get_roster_by_team 

    end  

    def print_leagues 

    end 

end 

