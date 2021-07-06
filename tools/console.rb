require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

nday = Cult.new("New Day", "San Francisco", 2008, "We will bring on The New Day")
cgolor = Cult.new("Church of Golor", "Raleigh", 2008, "Golor is coming")
hmaga = Cult.new("House of MAGA", "Pheonix", 2016, "MAGA")

becky = Follower.new("Becky", 24, "Golor in the New Day")
james = Follower.new("James", 20, "Golor is life")
sally = Follower.new("Sally", 54, "MAGA")

o1 = BloodOath.new(nday, becky, "2015-02-15")
o2 = BloodOath.new(cgolor, becky, "2014-08-23")
o3 = BloodOath.new(cgolor, james, "2002-12-25")
o4 = BloodOath.new(hmaga, sally, "2016-11-01") 




binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
