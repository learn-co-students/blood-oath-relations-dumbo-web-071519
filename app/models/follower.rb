class Follower
    @@all = []

    attr_reader :name, :age, :life_motto

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def get_cults
        BloodOath.all.select {|blood_oath| blood_oath.follower == self}
    end

    def cults
        self.get_cults.map{|blood_oath| blood_oath.cult}
    end

    def join_cult(cult)
        
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        @@all.select{|follower| follower.age >= age}
    end
end