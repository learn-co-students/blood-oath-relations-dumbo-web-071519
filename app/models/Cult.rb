class Cult

    attr_reader :name, :city, :founding_year, :slogan

    @@all = []

    def initialize(name, city, founding_year, slogan)
        @name = name
        @city = city
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end


    def this_cults_oaths
        BloodOath.all.select do |oath_id|
            oath_id.cult_id == self
        end
    end

    def my_followers
        this_cults_oaths.map do |oath|
            oath.follower_id
        end
    end

    def recruit_follower(follower_id)
        my_followers << (follower_id)
    end

    def cult_population
        my_followers.length
    end


    def self.find_by_name(cname)
        Cult.all.find do |cult|
            cult.name == cname
        end
    end


    def self.find_by_location(location)
        Cult.all.select do |cult|
            cult.city == location
        end
    end

    def self.find_by_founding_year(year)
        Cult.all.select do |cult|
            cult.founding_year == year
        end
    end
    
    def follower_ages
        self.my_followers.map do |follower|
            follower.age
        end
    end

    def average_age
        ages_summed = self.follower_ages.reduce { |sum, age| sum + age }
        ages_summed / my_followers.length.to_f
    end
    
    def my_followers_mottos
        self.my_followers.map do |follower|
            follower.motto
        end
    end



end