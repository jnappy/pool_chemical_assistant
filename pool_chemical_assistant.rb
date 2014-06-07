#constants
pi == 3.14
height_of_pool==4.5
constant_cubic_feet_to_gallons=7.48
#question1 what is the shape? Circle, Oval, Rectangular
#question2 what is the size of your pool?
#question3 what is the chlorine content out of 10.0ppm
#question4 what is the pH level out of 14?
#question5 what is the hardness level out of 250?

puts "What is the shape of your pool? (Circle, Oval, Inground Rectangle"
shape = gets.chomp.downcase 



def how_many_gallons 
	if shape == "round"
		puts "what diamter? (ex: 18 for an 18' round pool)"
		diameter=gets.chomp
		volume_round = 4*pi*(diamter**2)*height_of_pool 
		volume_in_gallons = volume_round*constant_cubic_feet_to_gallons



	if shape == "oval"
		puts "what is the width? (ex: 12 for a 12'x24' pool)"
		width = gets.chomp 
		puts "what is the length? (ex: 24 for a 12'x24' pool)"
		length = gets.chomp 
		volume_oval=pi*width*length*height_of_pool
		volume_in_gallons=volume_oval*constant_cubic_feet_to_gallons


	if shape == "inground_rectangle (ex: 15x30)" 
		puts "what is the inground width? (ex: 18 for an 18'x33' inground pool)"
		inground_width = gets.chomp
		puts "what is the inground length? (ex: 33 for an 18'x33' inground pool)"
		inground_length = gets.chomp 
		volume_inground = inground_length*inground_width*height_of_pool
		volume_in_gallons=volume_inground*constant_cubic_feet_to_gallons

	else 
		puts "please write Round, Oval, or Inground Rectangle"


end 



m = 5.0/10000.0
target_pH = 7.6
gallons_in_pool = 10000
current_pH = 7.0



volume = m*(target_pH-current_pH)*gallons_in_pool
puts "put #{volume} oz. of pH in your pool"
