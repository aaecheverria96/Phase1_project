


class Scraper 

    def get_leagues
        url = "https://www.espn.com/soccer/competitions" 
        html =  open("https://www.espn.com/soccer/competitions") 
        doc = Nokogiri::HTML(html) 
        leagues_container = doc.css("#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(1) > div > div > div > section > a") 
        leagues_container.each do |league| 
          League.new(league.children.attr("title").value, league.attr("href"))
        
        end 
      
      

        #return league_names
      end 

    def get_teams 

    end   

    def make_teams

    end 

    def get_players_by_team 

    end  

    def make_player

    end 

  
    def make_league 

    end 

    def get_roster_by_team 

    end  

    def print_leagues 

    end 

end 
#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(1) > div 
#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(1) > div > div:nth-child(1) > div > section > a