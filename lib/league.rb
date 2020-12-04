class League 
attr_accessor :name, :standing, :fixtures
@@all = []

def initialize(name, standing, fixtures) 
    @name, @standing, @fixtures =  name, standing, fixtures 
    self.class.show_all << self 
end  

def self.show_all 
@@all 
end 

def self.rest_all 
    show_all.clear 
end 

def self.show_fixtures_by_date
   
end  

def teams 

end 

def self.standings 

end 




end 