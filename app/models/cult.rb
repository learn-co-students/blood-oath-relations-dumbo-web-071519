class Cult
    @@all = []
    
    attr_reader :name, :location, :founding_year, :slogan, :min_age
    
    def initialize(name, location, founding_year, slogan, min_age)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @min_age = min_age
        
        @@all << self
    end
    
    def recruit_follower(follower, date)
        follower_age = follower.age
        if follower_age >= self.min_age
            BloodOath.new(follower, date ,self)
        else
            p "Sorry! This person is too young!"
        end

    end
    
    def followers
        BloodOath.all.select do |bloodoath|
            bloodoath.cult == self
        end.map{|bloodoath| bloodoath.follower}
    end

    def cult_population
        self.followers.count
    end

    def self.all
        ## returns an array of Cult instances
        @@all
    end

    def self.find_by_name(name)
        self.all.select{|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select{|cult| cult.location == location}
    end

    def self.find_by_founding_year(founding_year)
        self.all.select{|cult| cult.founding_year == founding_year}
    end


    def average_age
        all_ages = self.followers.map{|follower| follower.age}.sum.to_f 
        all_ages / self.cult_population
    end

    def my_followers_mottos
        self.followers.map{|follower| follower.life_motto}
    end

    def self.least_popular
        self.all.inject do |memo, cult|
            if memo.cult_population > cult.cult_population
                memo = cult
            end
            memo
        end
    end

    def self.most_common_location
        all_cult_locations = self.all.map{|cult| cult.location}
        all_cult_locations.inject do |memo, location|
            if ( all_cult_locations.count(memo) < all_cult_locations.count(location) )
                location
            else
                memo
            end
        end
    end
end