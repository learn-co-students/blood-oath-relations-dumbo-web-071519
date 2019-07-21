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

    def join_cult(cult, initiation_date)
        if self.age < cult.minimum_age
            puts "Sorry, you are too young for this cult!"
        else
            BloodOath.new(cult, self, initiation_date)
        end
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        @@all.select{|follower| follower.age >= age}
    end

    def my_cults_slogans
       self.cults.map{|cult| cult.slogan}
    end

    def self.assign_followers_by_cult_count
        follower_array = BloodOath.all.map {|blood_oath| blood_oath.follower}
        # Sorts location by frequency into a hash - code found here http://jerodsanto.net/2013/10/ruby-quick-tip-easily-count-occurrences-of-array-elements/
        sorted = follower_array.each_with_object(Hash.new(0)) {|follower, counts| counts[follower] += 1}
        # Finds kv pair with most frequency, returns an array with the city as first element
    end

    def self.most_active
        max_array = Follower.assign_followers_by_cult_count.max_by{|key, value| value}
        max_array[0]
    end

    def self.top_ten
        #reverses the sort to put followers with most cults at top
        sorted_array = Follower.assign_followers_by_cult_count.sort_by{|key, value| value}.reverse
        list_of_ten = []
        (0..9).each{|num| 
            if sorted_array[num] != nil
                list_of_ten << sorted_array[num][0]
            end
        }
        return list_of_ten
    end

    def fellow_cult_members
        fellow_mems = self.cults.map{|cult| cult.get_cult_members}
        flattened_and_uniq = fellow_mems.flatten.uniq
        flattened_and_uniq.delete(self)
        flattened_and_uniq
    end
end