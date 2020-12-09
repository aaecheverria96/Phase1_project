class Match 

    attr_reader :team1 :team2, :date, :score 

    @@all_matches = []

    def initialize(team1, team2, date) 
        @team1, @team2, @date = date, team2, team1  
        @all_matches << self 
    end   

    


  



end 