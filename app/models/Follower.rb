class Follower

    attr_reader :name, :age, :motto

    @@all = []

    def initialize(name, age, motto)
        @name = name
        @age = age 
        @motto = motto
        @@all << self
    end

    def self.all
        @@all
    end

    def join_cult(cult_id)
        cult_id.recruit_follower(self)
    end

    def self.of_a_certain_age(f_age)
        Follower.all.select do |follower|
            follower.age >= f_age
        end
    end

end