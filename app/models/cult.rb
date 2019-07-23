class Cult
    @@all=[]
    attr_accessor :name, :location, :slogan
    attr_reader :founding_year

    def initialize(name,location,founding_year,slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def recruit_follower(follower,initiation_date)
        BloodOath.new(self,follower,initiation_date) 
    end

    def all_bloodoath
        BloodOath.all.select do |bloodoath|
            bloodoath.cult == self
        end
    end

    def all_followers
        all_bloodoath.map do |bloodoath|
            bloodoath.follower
        end
    end

    def cult_population
        all_followers.count

    end

    def self.all
        @@all
    end

    def self.find_by_name(cult_name)
        @@all.find do |cult|
            cult.name == cult_name
        end
    end

    def self.find_by_location(cult_location)
        @@all.select do |cult|
            cult.location == cult_location
        end
    end

    def self.find_by_founding_year(year)
        @@all.select do |cult|
            cult.founding_year == year
        end
    end

    def average_age
        sum = 0
        all_followers.map do |follower|
            sum += follower.age
        end
        sum/cult_population
    end

    def my_followers_mottos
        all_followers.map do |follower|
            puts follower.life_motto
        end
    end

    def self.least_popular
       least = @@all.first
        @@all.map do |cult|
         if cult.all_followers.count < least.all_followers.count
            least = cult
         end
        end
        least
    end
    
    def self.all_locations
        @@all.map do |cult|
            cult.location
        end
    end

    def self.most_common_location
        most = all_locations.first
        all_locations.map do |location|
            if Cult.find_by_location(location).count > Cult.find_by_location(most).count
              most = location
            end
        end
        most
    end

end
