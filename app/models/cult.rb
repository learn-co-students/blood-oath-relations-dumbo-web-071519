class Cult
    @@all = []

    attr_reader :name, :location, :founding_year, :slogan

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def recruit_follower(follower, initiation_date)
        BloodOath.new(self, follower, initiation_date)
    end
    
    def cult_oaths
        BloodOath.all.select{|blood_oath| blood_oath.cult == self}
    end

    def cult_population
       self.cult_oaths.count
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        @@all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
        @@all.select {|cult| cult.location == location}
    end

    def self.find_by_founding_year(founding_year)
        @@all.select {|cult| cult.founding_year == founding_year}
    end

    def average_age
         ages = self.cult_oaths.map{|blood_oath| blood_oath.follower.age}
         avg = (ages.inject(0){|sum, i| sum + i}).to_f/ages.count.to_f
         avg
    end

    def my_followers_mottos
        self.cult_oaths.map{|blood_oath| blood_oath.follower.life_motto}
    end

    def self.least_popular
        cult_pops = Cult.all.map {|cult| cult.cult_population}
        index = cult_pops.index(cult_pops.min)
        Cult.all[index]
    end

    def self.most_common_location
        locations = Cult.all.map {|cult| cult.location}
        # Sorts location by frequency into a hash - code found here http://jerodsanto.net/2013/10/ruby-quick-tip-easily-count-occurrences-of-array-elements/
        sorted = locations.each_with_object(Hash.new(0)) {|word, counts| counts[word] += 1}
        # Finds kv pair with most frequency, returns an array with the city as first element
        common_location_hashes = sorted.max_by{|key, value| value}[0]
    end
end