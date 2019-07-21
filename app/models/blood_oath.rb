class BloodOath
    @@all = []

    attr_reader :cult, :follower, :initiation_date

    def initialize(cult, follower, initiation_date)
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        dates_array = @@all.map{|blood_oath| blood_oath.initiation_date}
        sorted = dates_array.sort
        @@all.find{|blood_oath| blood_oath.initiation_date == sorted.first}.follower
    end
    
end