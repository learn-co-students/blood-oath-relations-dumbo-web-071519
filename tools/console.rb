require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Required Arguments
#Follower(name, age, life_motto) => Follower.new("", Fixnum, "")
#BloodOath(initiation_date, cult, follower) => BloodOath.new("_YYYY-MM-DD_", cult, follower)
  #note: initiation_date is in the format _YYYY-MM-DD_.
#Cult(name, location, founding_year, slogan) => Cult.new("", "", Fixnum, "")

=begin
#Cult Model
* `Cult.all` => returns an `Array` of all the cults
* `Cult.find_by_name` => returns a `Cult` instance whose name matches that argument
* `Cult.find_by_location` => returns an `Array` of cults that are in that location
* `Cult.find_by_founding_year` => returns all of the cults founded in that year
=end



cult1 = Cult.new("mea culpa", "italy", 2000, "my sin")
cult1.name
cult1.founding_year
cult1.location
cult1.slogan
cult2 = Cult.new("carpe diem", "rome", 2001, "cease the day")
Cult.all
Cult.find_by_location("italy")
Cult.find_by_location("rome")
Cult.find_by_name("mea culpa")
Cult.find_by_name("carpe diem")
Cult.find_by_founding_year(2000)
Cult.find_by_founding_year(2001)

f1 = Follower.new("john", 25, "carpe carpe")
f1.name
f1.age
f1.life_motto

f2 = Follower.new("amy", 26, "poop sucks")

f1.join_cult("2017-08-07",cult2)
f1.join_cult("2019-06-07",cult1)

f2.join_cult("2018-06-07",cult2)

#cult1.recruit_follower(f2)


Follower.all
f1.cults
f2.cults

BloodOath.all
# BloodOath.first_oath => needs work

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
