class Cult

  attr_reader :name, :location, :founding_year, :followers
  attr_accessor :minimum_age, :slogan
  @@all = []

  def initialize(name, location, founding_year)
    @name = name
    @location = location
    @founding_year = founding_year
    @minimum_age = 18
    @slogan = "Default Slogan"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|cult| cult.name == name}
  end

  def self.find_by_location(location)
    self.all.select {|cult| cult.location == location}
  end

  def self.find_by_founding_year(year)
    self.all.select {|cult| cult.founding_year == year}
  end

  def self.least_popular
    smallest = self.all.map {|cult| cult.followers.size}.min
    self.all.select {|cult| cult.followers.size == smallest}
  end

  def self.most_common_location
    locations = self.all.map {|cult| cult.location}
    most_common_location = locations.max_by{|location| locations.count(location)}
  end

  def followers
    BloodOath.all.select {|oath| oath.cult == self}.map {|oath| oath.follower}
  end

  def recruit_follower(follower)
    if follower.age < self.minimum_age
      puts "You are too young to join this cult."
    else
      BloodOath.new(self, follower)
    end
  end

  def cult_population
    self.followers.size
  end

  def average_age
    (self.followers.map {|follower| follower.age.to_f}.sum) / self.followers.size
  end

  def my_followers_mottos
    self.followers.map do |follower|
      puts follower.motto
    end
  end


end
