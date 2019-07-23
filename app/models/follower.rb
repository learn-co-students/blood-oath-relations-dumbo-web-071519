class Follower
    @@all = []
    attr_accessor :name, :age, :life_motto
    def initialize(name, age,life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end
    def all_bloodoath
        BloodOath.all.select do |bloodoath|
            bloodoath.follower == self
        end
    end

    def cults
        all_bloodoath.map do |bloodoath|
            bloodoath.cult
        end
    end
    def join_cult(cult, initiation_date)
        BloodOath.new(cult,self,initiation_date) 
    end

    def self.of_a_certain_age(age)
        @@all.select do |follower|
            follower.age == age
        end
    end

    def my_cults_slogans
        cults.map do |cult|
            puts cult.slogan
        end
    end
 
    def self.most_active
        most = @@all.first
        most_cult = BloodOath.cult_by_follower(most).count
        @@all.map do |follower|
            total_cult = BloodOath.cult_by_follower(follower).count
            if  total_cult > most_cult
                most = follower
            end
        end
        most
    end

    def self.top_ten
        most = @@all.first
        most_cult = BloodOath.cult_by_follower(most).count
        arr = []
        @@all.map do |follower|
          total_cult = BloodOath.cult_by_follower(follower).count
          if total_cult > most_cult
            arr.unshift(follower)
          else
            arr.push(follower)
          end
        end
        arr
    end

end