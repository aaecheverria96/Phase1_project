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
        #standings_container = doc.css("#main-container > div > section.col-c.chk-height > article > div > table > tbody  tr" )

        #standings_container.each do |standing| 
         # League.new
       

      end 

    def get_teams 
     url = "https://www.espn.com/soccer/league/_/name/UEFA.CHAMPIONS/uefa-champions-league"
     html = open(url) 
     doc = Nokogiri::HTML(html) 
     binding.pry 
       #doc.css("#fittPageContainer > div.page-container.cf > div > div > div.Wrapper.bg-clr-white.br-5.mb3.pa5 > div.layout.is-split")
    end   

    def make_teams

    end 

    def get_players_by_team 
      #doc.css("#fittPageContainer > div.StickyContainer > div.page-container.cf > div")
    end  

    def make_player

    end

    def get_roster_by_team 

    end  

    

end 
#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(1) > div 
#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(1) > div > div:nth-child(1) > div > section > a