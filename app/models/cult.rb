class Cult

    attr_reader :name, :location, :founding_year, :slogan
    @@all =[]

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    #**`Cult` Instance Methods**

    #* `Cult#followers`
    #    * returns an 'Array' of this cult's followers
    def followers
        BloodOath.all.select do |bloodoath|
            bloodoath.cult == self
        end
    end

    #* `Cult#followers_age`
    #    * returns an 'Array' of the age of each follower of this cult
    def followers_age 
        self.followers.map do |follower|
            follower.age
        end
    end

    #* `Cult#average_age`
    #    * returns a `Float` that is the average age of this cult's followers
    def average_age
        self.followers_age.sum / self.cult_population
    end

    #* `Cult#my_followers_mottos`
    #    * prints out all of the mottos for this cult's followers
    def my_followers_mottos
        self.followers.map do |follower|
            follower.life_motto
        end
    end

    #* `Cult#recruit_follower`
    #    *  takes in an argument of a `Follower` instance and adds them to 
    #this cult's list of followers
    def recruit_follower(follower)
        follower.join_cult("2019-07-01",self)
    end

    #* `Cult#cult_population`
    #    * returns a `Fixnum` that is the number of followers in this cult
    def cult_population
        self.followers.count
    end

#    **`Cult` Class Methods**

#    * `Cult.least_popular`
#        * returns the `Cult` instance who has the least number of followers :(
    def self.least_popular
        self.all.map do |cult|
            cult.cult_population
        end
    end

    def self.locations
        self.all.map do |cult|
            cult.location
        end.uniq
    end

    def self.location_count_data
        location_count = {} # "location" => count, "location" => count
        self.locations.map do |location|
            location_count[location] = self.find_by_location(location).count
        end
        location_count.sort_by{|key,value| value}
    end

#    * `Cult.most_common_location`
#        * returns a `String` that is the location with the most cults
    def self.most_common_location
        self.location_count_data.last[0]
    end

    def self.find_by_founding_year(founding_year)
        self.all.select do |cult|
            cult.founding_year == founding_year
        end
    end

    def self.find_by_location(location)
        self.all.select do |cult|
            cult.location == location
        end
    end

    def self.find_by_name(name)
        self.all.find do |cult|
            cult.name == name
        end
    end

    def self.all
        @@all
    end


end