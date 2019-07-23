class Follower

    attr_accessor :life_motto
    attr_reader :name, :age
    @@all =[]

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def cults 
        BloodOath.all.select do |bloodoath|
            bloodoath.follower == self
        end.uniq
    end


    def join_cult(initiation_date, cult)
        BloodOath.new(initiation_date, cult, self)
    end



#**`Follower` Instance Methods**
    #    * `Follower#my_cults_slogans`
    #        * prints out all of the slogans for this follower's cults

    def my_cults_slogans
        self.cults.each do |cult|
            puts cult.slogans
        end
    end


#**`Follower` Class Methods**

    def self.cult_count_data
        num_cults = {}
        #for each follower 
            #count how many cults they are a part of
        self.all.each do |follower|
            num_cults[follower] = follower.cults.count
        end
        num_cults.sort_by{|key,value| value}
    end

    #* `Follower.most_active`
    #    *  returns the `Follower` instance who has joined the most cults
    def self.most_active
        self.cult_count_data.last[0]
    end

    #* `Follower.top_ten`
    #    * returns an `Array` of followers; they are the ten most active followers
    def self.top_ten
        if self.cult_count_data.length > 10
            return self.cult_count_data[-10,10]
        else
            return self.cult_count_data
        end
    end
    #* `Follower.of_a_certain_age`
    #    * takes a `Fixnum` argument that is an age and returns an `Array` 
    #    of followers who are the given age or older
    def self.of_a_certain_age(age)
        self.all.select do |follower|
            follower.age >= age
        end
    end

    def self.all
        @@all
    end

end