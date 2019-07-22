class Follower

  attr_reader :name, :age
  attr_accessor :motto
  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @motto = "Default Motto"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age(age)
    self.all.select {|follower| follower.age >= age}
  end

  def self.followers_by_activity
    stats = Hash.new(0)
    self.all.each {|follower| stats[follower] = follower.cults.size}
    stats.sort_by {|_key, value| value}.reverse.to_h
  end

  def self.most_active
    self.followers_by_activity.keys[0]
  end

  def self.top_ten
    self.followers_by_activity.keys[0..10]
  end

  def cults
    BloodOath.all.select {|oath| oath.follower == self}.map {|oath| oath.cult}
  end

  def join_cult(cult)
    if self.age < cult.minimum_age
      puts "You are too young to join this cult."
    else
      BloodOath.new(cult, self)
    end
  end

  def my_cults_slogans
    self.cults.map do |cult|
      puts cult.slogan
    end 
  end

  def fellow_cult_members
    self.cults.map do |cult|
    BloodOath.all.select {|oath| oath.cult == cult}.map{|oath| oath.follower}
    end.flatten.uniq - [self]
  end

end
