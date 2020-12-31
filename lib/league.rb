class League 
attr_accessor :name, :url, :teams
@@all = []

def initialize(name, url) 
     @name, @url =  name, url
    self.class.show_all << self 
end

def self.show_all 
@@all 
end 

def self.rest_all 
    show_all.clear 
end  

def teams 
    Team.show_all.select {|team| team.league == self}
end

def display_teams 
    league_table = TTY::Table.new(header: ["Id","Name", "Wins", "Losses", "Draws", "Points" ])
        self.teams.each.with_index(1) do |team, i| 
            league_table << ["#{i}".red, "#{team.name}", "#{team.wins}", "#{team.losses}", "#{team.draws}", "#{team.points}"]
        end
         league_table.render(:unicode)
end 


end 