class Car
    attr_accessor :id, :make, :model, :year, :mpg 
    def find
        puts "find car"
    end
end

# 1) find the distance of trip
# inputs start and end points
# output distance in miles?
def distance(start_point, end_point)
end

# 2) fetch the mpgs for a given car
#  inputs car model
#  output mpg
def fetch_mpg(car)
    # moved to a model method, car.mpg
end

# 3) calculate gallon of gas per trip
# input total miles and mpg
# output total gallons of trip
def gallons_per_trip(distance, mpg)
end

# 4) fetch average gas prices in area
# input area, gas type
# output average cost of gas 
def fetch_avg_cost_gallons(area='Los Angeles', type='unleaded')
    # use another api
    result=3.01
end


# 5) calculate cost of gallons/ trip
# input total gallons and cost_per_gallons
# output cost of trip
def cost_of_trip(gallons=2.22, avg_cost_gallons=3.01)
    result = gallons*avg_cost_gallons
    puts "$ #{result}"
end

cost_of_trip()