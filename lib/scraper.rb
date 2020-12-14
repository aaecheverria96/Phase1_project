require 'pry'


class Scraper

    def get_leagues
        leagues_included = ["English Premier League", "German Bundesliga", "French Ligue 1", "Spanish Primera División", "Italian Serie A"]
        url = "https://www.espn.com/soccer/competitions" 
        html =  open(url) 
        doc = Nokogiri::HTML(html)
        first_leagues_container = doc.css("#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(1) > div > div > div > section > a") 
        first_leagues_container.each do |league|
          league_name = league.children.attr("title").value

          if leagues_included.include?(league_name)
            League.new(league_name, league.attr("href"))
          end
        end

        second_leagues_container = doc.css("#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(2) > div > div > div > section > a") 
        second_leagues_container.each do |league|
          league_name = league.children.attr("title").value

          if leagues_included.include?(league_name)
            League.new(league_name, league.attr("href"))
          end
        end 
      end 

      


      def get_standings(url) 
        html = open(url) 
        doc = Nokogiri::HTML(html) 
        
        standings_container = doc.css("#main-container > div > section.col-c.chk-height > article > div > table > tbody  tr" )

        standings_container.each_with_index do |team, index|
          name = team.css("td")[0].text
          points = team.css("td")[6].text
          wins = team.css("td")[2].text
          losses = team.css("td")[4].text
          draws = team.css("td")[3].text

          puts "#{index + 1}. #{name}, Wins: #{wins}, Losses: #{losses}, Draws: #{draws}, Points: #{points}"
        end 
      end
end 
#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(1) > div 
#fittPageContainer > div.page-container.cf > div > div > div > div:nth-child(3) > div:nth-child(1) > div > div:nth-child(1) > div > section > a