#This assumes pool owner uses the following chemicals:
#ph UP to increase the pH
#pH DOWN to decrease the pH
#GreenOut shock to shock the pool 


#This determines the size of the pool based on the shape and dimensions
@pi = 3.14
@height_of_pool=4.5
@constant_cubic_feet_to_gallons=7.48
@target_pH=7.6

def how_many_gallons shape
	go_on = true
	go_on_2 = true
	while(go_on)
		if shape == "round"
			while(go_on_2)
				puts "what diamter? (ex: 18 for an 18' round pool)"
				diameter=gets.chomp.to_i
				if diameter > 0
					volume_round = 1.0/4.0*@pi*(diameter**2.0)*@height_of_pool 
					volume_in_gallons = volume_round*@constant_cubic_feet_to_gallons
					puts volume_in_gallons
					go_on_2 = false
				end
			end
			go_on = false



		elsif shape == "oval"
			puts "what is the width? (ex: 12 for a 12'x24' pool)"
			width = gets.chomp 
			puts "what is the length? (ex: 24 for a 12'x24' pool)"
			length = gets.chomp 
			volume_oval=@pi*width*length*@height_of_pool
			volume_in_gallons=volume_oval*@constant_cubic_feet_to_gallons
			go_on = false

		elsif shape == "inground rectangle" 
			puts "what is the inground width? (ex: 18 for an 18'x33' inground pool)"
			inground_width = gets.chomp
			puts "what is the inground length? (ex: 33 for an 18'x33' inground pool)"
			inground_length = gets.chomp 
			volume_inground = inground_length*inground_width*@height_of_pool
			volume_in_gallons=volume_inground*@constant_cubic_feet_to_gallons
			go_on = false

		else 
			puts "please write round, oval, inground rectangle"
			shape = gets.chomp.downcase 
		end

	end

	return volume_in_gallons
#variable to be used "volume_in_gallons"
end 



#This determines whether or not the pool owner should shock the pool based on previous maintenance 

#the following code assumes a dosage of 1 bag of shock per 10,000 gallons of pools water 
def should_you_shock_the_pool shock
	go_on = true
	while(go_on)
		if shock=="yes"
			puts "Do not add any more pool shock at this time!"
			go_on = false
		elsif shock=="no"
			puts @volume_in_gallons
			amount_of_shock_to_add = @volume_in_gallons*(1.0/10000.0)
			#the following code rounds the amount of shock to the nearest half-bag
			amount_of_shock_to_add_rounded = ((amount_of_shock_to_add*2.0).round)/2.0
			puts "Add #{amount_of_shock_to_add} bags of GreenOut to your pool"
			go_on = false
		else 
			puts "Please answer yes or no!"
			shock = gets.chomp.downcase
		end

	end


	return amount_of_shock_to_add_rounded
end 

#This determines whether or not the pool owner should add pH based on pH value 
def how_much_pH_chemical_should_be_added pH, volume_in_gallons
	go_on = true
	while(go_on)
		if pH < @target_pH
			amount_of_pH_to_add = volume_in_gallons*(2/(10000*0.1)*(@target_pH - pH))
			amount_of_pH_to_add_rounded = (2*amount_of_shock_to_add).rounded/2
			puts "Please add #{amount_of_pH_to_add_rounded} of pH UP to your pool"
			go_on = false
		elsif pH==@target_pH
			puts "pH is perfect! No need to adjust!"
			go_on = false
		else 
			volume_in_gallons*(2/(10000*0.1)*(pH - @target_pH))
			amount_of_pH_to_add_rounded = (2*amount_of_shock_to_add).rounded/2
			puts "Please add #{amount_of_pH_to_add_rounded} of pH DOWN to your pool"

		end	
		return amount_of_pH_to_add_rounded
	end

end


puts "What is the shape of your pool? (round, oval, inground rectangle)"
shape = gets.chomp.downcase 
@volume_in_gallons = how_many_gallons(shape)

puts "Did you shock your pool in the last 7 days? Yes or No"
shock=gets.chomp.downcase 
amount_of_shock_to_add_rounded = should_you_shock_the_pool(shock)

puts "What is your pH value out of 14?"
pH=gets.chomp.to_f #converts from string to float 
amount_of_pH_to_add_rounded = how_much_pH_chemical_should_be_added(pH, @volume_in_gallons)




# m = 5.0/10000.0
# target_pH = 7.6
# gallons_in_pool = 10000
# current_pH = 7.0



# volume = m*(target_pH-current_pH)*gallons_in_pool
# puts "put #{volume} oz. of pH in your pool"
