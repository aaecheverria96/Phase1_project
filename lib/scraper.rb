require 'pry'


class Scraper 

    def get_leagues
        url = "https://www.espn.com/soccer/competitions" 
        html =  open(url) 
        doc = Nokogiri::HTML(html) 
        leagues_container = doc.css("#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(1) > div > div > div > section > a") 
        leagues_container.each do |league| 
          League.new(league.children.attr("title").value, league.attr("href"))
        
        end 
      end 

      #def get_league_scores(url)
        #html = open(url) 
        #doc = Nokogiri::HTML(html) 
       # get_dates = doc.css("#scoreboard-page > div.carousel-wrap > div.date-picker-carousel.slick-initialized.slick-slider > div > div > div")
        

      #end 


      def get_standings
        url = "https://www.espn.com/soccer/league/_/name/USA.1/USA.1"
        html = open(url) 
        doc = Nokogiri::HTML(html) 
        standings_container = "#main-container > div > section.col-c.chk-height > article > div > table > tbody  tr"
        
       
       #get_standings = doc.css("#main-container > div > section.col-c.chk-height > article > div > table > tbody:nth-child(2)") 
       

      end 

    def get_teams 
     
       
    end   

    def make_teams

    end 

    def get_players_by_team 

    end  

    def make_player

    end

    def get_roster_by_team 

    end  

    

end 
#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(1) > div 
#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(1) > div > div:nth-child(1) > div > section > a