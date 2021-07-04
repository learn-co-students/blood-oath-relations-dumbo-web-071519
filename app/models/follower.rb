class Follower
    @@all = []

    ##can't change their name, only read it
    attr_reader :name, :age, :life_motto

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto =life_motto

        @@all << self
    end

    def cults
        all_bloodoaths = BloodOath.all.select{|bloodoath| bloodoath.follower == self}
        all_bloodoaths.map{|bloodoath| bloodoath.cult}
    end

    def join_cult(cult, date)
        self_age = self.age
        if (self.age >= cult.min_age)
            BloodOath.new(self, date, cult)
        else
            p "Sorry! You are too young to join this cult!"
        end
    end

    def self.all
        ## Return array of follower instances
        @@all
    end

    def self.of_a_certain_age(age)
       self.all.select{|follower| follower.age >= age} 
    end

    # ! Advanced Methods - Analytics!
    # !

    def my_cults_slogans
        self.cults.map{|cult| cult.slogan}
    end

    def self.top_ten
        sorted_by_cults = self.all.sort_by{|follower| -follower.cults.count}.map{|follower| follower.name}
        if sorted_by_cults.length > 10
            sorted_by_cults.slice(0,10)
        else
            sorted_by_cults
        end
    end

    def self.most_active
        all_bloodoaths = BloodOath.all.map{|bloodoath| bloodoath.follower}
        self.all.inject do |memo, follower|
            if ( all_bloodoaths.count(memo) < all_bloodoaths.count(follower))
                follower
            else
                memo
            end
        end.name
    end

    # ! Bonus

    def fellow_cult_members
        self.cults.map do |cult|
            cult.followers.select {|follower| follower != self}
        end.flatten.uniq
    end

end