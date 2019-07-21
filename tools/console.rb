require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
c1 = Cult.new("foo", "Vegas", 1992, "the end is nigh")
c2 = Cult.new("fum", "Ohio", 1985, "Koolaid Taste good")
c3 = Cult.new("oof", "Vegas", 1889, "beer and bros")
c4 = Cult.new("bad", "Washington", 1992, "This cults sucks")

f1 = Follower.new("bro", 25, "I love cheese")
f2 = Follower.new("dude", 45, "Simpsons rule")
f3 = Follower.new("guy", 25, "capitalism sucks")
f4 = Follower.new("hella", 68, "communism sucks")
f5 = Follower.new("youngin", 20, "game of thrones sucks")

bo1 = BloodOath.new(c1, f1, "2010-02-01")
bo2 = BloodOath.new(c1, f2, "1992-03-17")
bo3 = BloodOath.new(c3, f3, "1998-04-05")
bo4 = BloodOath.new(c3, f1, "2000-11-10")
bo5 = BloodOath.new(c2, f4, "1993-02-01")


binding.pry




puts "Here!"

puts "Mwahahaha!" # just in case pry is buggy and exits
