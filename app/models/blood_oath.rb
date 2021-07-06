class BloodOath

    attr_reader :cult_id, :follower_id, :initiation_date
    

    @@all = []

    def initialize(cult_id, follower_id, initiation_date)
        @cult_id = cult_id
        @follower_id = follower_id
        @initiation_date = initiation_date
        @@all << self
    end

    def self.all
        @@all
    end

end