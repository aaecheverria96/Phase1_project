class League 
attr_accessor :name, :url, :standing, :teams 
@@all = []

def initialize(name, url) 
    @standing, @name, @url = standing, name, url
    self.class.show_all << self 
end

def self.show_all 
@@all 
end 

def self.rest_all 
    show_all.clear 
end 








end 