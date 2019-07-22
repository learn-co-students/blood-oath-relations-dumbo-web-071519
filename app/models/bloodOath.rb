class BloodOath
  attr_reader :cult, :follower
  attr_accessor :initiation_date
  @@all = []

  def initialize(cult, follower)
    @cult = cult
    @follower = follower
    @initiation_date = Time.new.strftime("%Y-%m-%d")
    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    self.all.sort_by {|oath| oath.initiation_date}.first
  end

end
