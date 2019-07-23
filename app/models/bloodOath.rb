class BloodOath
    @@all=[]
    attr_accessor :cult, :follower, :initiation_date
    
    def initialize(cult, follower, initiation_date)
        @initiation_date = initiation_date
        @cult = cult
        @follower = follower
        @@all << self
    end

    def self.all
        @@all
    end
    def self.first_oath
        @@all.first.follower
    end

    def self.all_followers
        @@all.map do |bloodOath|
            bloodOath.follower
        end
    end
    def self.follower_by_name(follower_ins)
         @@all.select do |bloodOath|
            follower_ins == bloodOath.follower
         end
    end

    def self.cult_by_follower(follower_ins)
        BloodOath.follower_by_name(follower_ins).map do |bloodOath|
        bloodOath.cult
        end
   end

end