class Team 
attr_accessor :name, :roster 

def initialize(name) 
@name,  @roster = name, roster 
end  

def players 
 Player.all.select {|player| player.team == self}
end 


end 