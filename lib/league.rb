class League 
attr_accessor :name, :url, :matches 
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

def self.show_matches_by_league
   Match.show_all {|match| match.league == self}
end  

def teams 

end 

def self.standings 

end 




end 