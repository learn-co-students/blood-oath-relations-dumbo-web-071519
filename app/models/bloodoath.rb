class BloodOath
    attr_accessor :cult, :follower
    attr_reader :initiation_date
    @@all =[]

    def initialize(initiation_date, cult, follower)
        @initiation_date = initiation_date
        @cult = cult
        @follower = follower
        @@all << self
    end

    def self.all
        @@all
    end

=begin
    * `BloodOath.first_oath`
        * returns the `Follower` instance for the follower that made the very 
        first blood oath
=end

    # def self.first_oath
    #     self.all.sort do |oath|
    #         oath.initiation_date.to_i
    #     end.first
    # end
end