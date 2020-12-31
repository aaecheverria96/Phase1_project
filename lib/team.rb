class Team 
attr_accessor :name, :wins, :losses, :draws, :points, :league, :team_url 
@@all = []

def initialize(team_hash)
    @name, @wins, @losses, @draws, @points, @league, @team_url = team_hash[:name], team_hash[:wins], team_hash[:losses], team_hash[:draws], team_hash[:points], team_hash[:league], team_hash[:team_url]
    self.class.show_all << self 
end 

def self.show_all 
        @@all 
end 

def self.reset_all 
    show_all.clear
end  


end 