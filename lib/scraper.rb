require 'pry'


class Scraper

    def get_leagues
        leagues_included = ["English Premier League", "German Bundesliga", "French Ligue 1", "Spanish Primera División", "Italian Serie A"]
        url = "https://www.espn.com/soccer/competitions" 
        html =  open(url) 
        doc = Nokogiri::HTML(html)
        first_leagues_container = doc.css("#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(7) > div:nth-child(1) > div div.ContentList__Item") 
          
        first_leagues_container.each do |league| 
            
            league_url = league.css("section > div > div > span:nth-child(2) a").attr("href").value 
        league_name = league.css("section div.pl3 h2").text 
         
        if leagues_included.include?(league_name)
           League.new(league_name, league_url)
      end 
    
    end 
     
  end 
      

      


      def get_teams(url, league) 
        html = open(url) 
        doc = Nokogiri::HTML(html) 
        
        standings_container = doc.css("#main-container > div > section.col-c.chk-height > article > div > table > tbody  tr" )

        rows = standings_container.collect do |team| 
          name = team.css("td")[0].text
          points = team.css("td")[6].text
          wins = team.css("td")[2].text
          losses = team.css("td")[4].text
          draws = team.css("td")[3].text
          team_url = team.css("td")[0].children[0].attr("href")
          team = {name: name, wins: wins, losses: losses, draws: draws, points: points, team_url: team_url, league: league}
          Team.new(team)
        end 
        #Team.new(name, wins, losses, draws, points, league)
      end
end 
#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(1) > div 
#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(1) > div > div:nth-child(1) > div > section > a