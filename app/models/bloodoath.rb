class BloodOath
    @@all = []

    attr_reader :follower, :initiation_date, :cult

    def initialize(follower, initiation_date, cult)
        @follower = follower
        @initiation_date = initiation_date
        @cult = cult
        p follower.age
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        self.all.inject do |memo, bloodoath|
            if !(memo.initiation_date > bloodoath.initiation_date)
                memo
            else
                bloodoath
            end
        end.follower
    end

end