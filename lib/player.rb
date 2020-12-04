class Player 
attr_accessor :name, :number, :team 

@@all = [] 

def initialize(name, number, team)
self.number = number 
self.name = name 
self.team = team 
self.class.all << self 
end   

def self.sort_players_by_number 
    self.all.sort_by {|player| player.number} 
end  

def self.all 
    @@all 
end 



end 