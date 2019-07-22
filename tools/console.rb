require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

osho = Cult.new("Osho", "India", 1965)
fzi = Cult.new("FZI", "New York", 1942)
ananda = Cult.new("Ananda", "New York", 1972)
jim = Follower.new("Jim", 45)
bob = Follower.new("Bob", 23)
marissa = Follower.new("Marissa", 78)
tim = Follower.new("Tim", 56)
baby = Follower.new("Baby", 17)

osho.recruit_follower(marissa)
ananda.recruit_follower(bob)
osho.recruit_follower(jim)
fzi.recruit_follower(tim)
tim.join_cult(ananda)
marissa.join_cult(fzi)
ananda.recruit_follower(baby)
baby.join_cult(ananda)
earliest = BloodOath.new(osho, tim)
earliest.initiation_date = "01-01-2000"
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
