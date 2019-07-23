require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1=Cult.new("Gaga","NYC",2001,"I love Codinig!")
cult2=Cult.new("HACK","NYC",2001,"Algorithm is our life!")
follower1=Follower.new("Steve", 16,"Hello world!")
follower2=Follower.new("David", 25,"I want to Code!")

#cult1.recruit_follower(follower1, "2003-02-08")
follower1.join_cult(cult1, "2005-11-10")
follower1.join_cult(cult2, "2005-11-10")
follower2.join_cult(cult1, "2005-11-10")
#bloodOath1=BloodOath.new(cult1, follower1, "2003-02-08")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
