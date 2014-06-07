#constants
m = 5.0/10000.0
target_pH = 7.6
gallons_in_pool = 10000
current_pH = 7.0



volume = m*(target_pH-current_pH)*gallons_in_pool
puts "put #{volume} oz. of pH in your pool"
