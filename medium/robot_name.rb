require "pry"
=begin
- Write a program that manages robot factory settings
- initially, robots have no name
    - when you "boot" them up, a random name is generated
       - Two capital letters, and three numbers
- we can reset a robot to factory settings
    - the name is set to nil
        - when we ask for a name, a new name will get assigned

- names should be random
     - avoid repeating names
     

Classes/Methods:
-Robot class
-Instance method name
-Instance method reset


Problem: Instance method name
- input - none
- output - string

- when we call name on an object, we first check if the object has a value 
 assigned to @name - if not, assign a random name
       - two uppercase letters
       - a three digit number
- when we call name, it should simply return the name if one has already been assigned


- set @name to a random name unless a value has already been assigned
- if we are to set a name, add the name to an array to keep track of used names 
    - keep producing random names until a name that has not been used is generated, and assign it to the @name instance variable

- return the value of @name



Problem: Reset name
-input -  none
-output - nil

- reset name to "factory settings"

=end

# SAME_INITIAL_ROBOT_NAME_SEED = 1000
   
class Robot
  LETTERS = ("A".."Z").to_a
  NUMBERS = (100..999).to_a
  @@used_names = []

  def name
    if @name
      @name
    else
      @name = random_name while @@used_names.include?(@name)
      @@used_names << @name
    end
    @name
  end

  def reset
    @name = nil
    @name
  end

  def random_name
    new_name = ''
    2.times { new_name += LETTERS.sample }
    new_name += NUMBERS.sample.to_s

    new_name
  end
end

# scotty = Robot.new
# Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
# scotty.name



# tom = Robot.new
# Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
# tom.name


# p scotty.name == tom.name

# p scotty.name
# p tom.name

