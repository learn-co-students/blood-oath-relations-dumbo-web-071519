require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cat_cult = Cult.new("Kool Katz", "The Allyway", 2018, "meow meow", 1)
lion_cult = Cult.new("Simba's Katz", "The Allyway", 2015, "MEOW MEOW", 1)
house_cult = Cult.new("House Cats", "Home", 2000, "zzzz", 3)
stray_cult = Cult.new("Da Strays", "Brooklyn", 2009, "We are the orginals", 1)
box_cult = Cult.new("Amazon Inc", "Recycling Bin",2019, "squares", 5)

wiskers = Follower.new("Wisker", 6, "where is my food")
shadow = Follower.new("Shadow", 3, "my soul is black like my fur")
chairman_meow = Follower.new("Chairman Meow", 10, "feed me")
hermeowie = Follower.new("Hermeowie", 12, "wet food only")
frisky = Follower.new("Frisky", 7, "I have a food brand")
whiteclaw = Follower.new("White Claw", 12, "I am ninja cat")
tubbs = Follower.new("Tubbs", 5, "Feed Me.")
pickles = Follower.new("Pickles", 2, "let the things hit the floor!")
sunny = Follower.new("Sunny", 4, "sunbathing is life")
snowy = Follower.new("Snowy", 10, "snow is life")
bandit = Follower.new("Bandit", 5, "I will be the top ninja cat")
willow = Follower.new("Willow", 2, "got milk?")
apricot = Follower.new("Apricot", 10, "box life")




bloodoath1 = BloodOath.new(wiskers, "2019-08-01", cat_cult)

bloodoath2 = BloodOath.new(shadow, "2019-07-15", cat_cult)

bloodoath3 = BloodOath.new(chairman_meow, "2019-02-23", cat_cult)
bloodoath5 = BloodOath.new(chairman_meow, "2019-08-15", lion_cult)

bloodoath4 = BloodOath.new(hermeowie, "2019-02-15", cat_cult)
bloodoath6 = BloodOath.new(hermeowie, "2019-07-05", lion_cult)
bloodoath7 = BloodOath.new(hermeowie, "2019-09-09", house_cult)
bloodoath8 = BloodOath.new(hermeowie, "2019-10-01", box_cult)

bloodoath9 = BloodOath.new(apricot, "2019-09-09", house_cult)
bloodoath10 = BloodOath.new(apricot, "2019-10-01", box_cult)

bloodoath11 = BloodOath.new(tubbs, "2019-09-09", house_cult)
bloodoath12 = BloodOath.new(tubbs, "2019-10-01", cat_cult)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
