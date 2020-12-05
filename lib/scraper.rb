require 'nokogiri' 
require 'open-uri'
require 'pry'


class Scraper 

    def get_page 
        doc = Nokogiri::HTML(open("https://www.espn.com/soccer/"))
        binding.pry
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

Scraper.new.get_page 