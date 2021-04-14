/*
*	Primative types
*	TODO: Print Stuff
*/

/*
*	The first and most important primative in Io is Object, all other types
*	inherit their values and functions from it
*/

a := Object clone	 // Here we create a new Object instance called a using the clone method

//Primatives in Io have there own predefined methods build in C , here are a few examples of the Object Primative's Methods

a isTrue	// isTrue returns whether or not the Object value is true, note that Object respresents boolean types in other languages for this example

b := Object clone	// Create another Object instance

a compare(b) 	// This is similiar to compare methods of other langauges, it returns an integer based on the comparison value of the Objects

/*
*
*	Another example of a primative in Io would be the Number primitive, which contains
*	a 64 bit floating point number aka a double
*
*/

num1 := Number clone	// Create an instance of a number called num1 by cloning the Number primative

num2 := 12 		// Create an instance of a number called num2 and set it to 12

//Like Object, Number comes with some predefined methods

num1 isEven		// isEven checks if a Number is even 

num1 %(num2)		// This method returns num1 % num2

// Since Object is a parent of Number, Number can use Object's methods

num1 isTrue		// Checks if the number evaulates to true

// However the previous rule is not bidirectional, as Object cannot use Number's methods

// Uncomment the code below to see what happens
// a isEven

/*
*
*	Many other primative types exist in Io and they act similiarly 
*	to the two defined below but have different purposes
*
*/

foo := "foo"
bar :=  "bar"
foobar := foo .. bar	// Strings in Io, the .. operator is used for concatination

laundry := List clone append("t-shirt","jeans","socks") 
numbers := List clone append(1,2,3,4,5)		// Two examples of lists in Io note that both are of type list, not int list or string list like in sml


/*
*      Polymorphism
*      To show off the polymorphic capabilities lets start with the car object from the first program.
*
*/

Car := Object clone

Car fullTank := 20.0 // What a full tank should equal
Car gasTank := 20.0 // Current gas car has
Car location := 0 // Current location of car
Car milesPerGallon := 30.0 // MPG of car
Car cleanliness := 100 // How clean the front car window is
Car make := "Kia" // Default make can be changed
Car model := "Optima" // Default model can be changed
Car radioStations := List clone // Holds saved radio stations for car

/*
 * Method that takes a distance and checks if car has enough gas to travel that far
*/
Car calculateTank := method(distance,
    if((distance/milesPerGallon) > gasTank or (cleanliness - (distance / 5)) < 0, "Not enough fuel or car too dirty, fill tank or use wipers" println return false, return true)
)

/*
 * Takes a distance and calls needs methods to move car and update gasTank
*/
Car drive := method(distance,
    if(calculateTank(distance), updateTank(distance)
    moveCar(distance))
)

/*
 * Takes a distance and updates current locaiton of care
*/
Car moveCar := method(distance,
    location = location + distance
    cleanliness = cleanliness - (distance / 5)
)

/*
 * Takes a distance and updates gas left in gas tank
*/
Car updateTank := method(distance,
    gasTank = gasTank - abs(distance)/milesPerGallon
)

/*
 * Fills gas tank to full
*/
Car fillTank := method(
    gasTank = fullTank
)

/*
 * Activates wipers until car window is clean
*/
Car useWipers := method(
    while(cleanliness < 80,
        "*Squeek* *Squeek* windshield wipers move back and forth and clean the window" println
        cleanliness = cleanliness + 5
    )
    "Window is clean" println
)

/*
 * Takes the name or number of a radion station and adds it to saved stations
*/
Car addStation := method(station,
    radioStations append(station)
)

/*
 * Get absolute value of number
*/
Car abs := method(x,
    if(x < 0, return -x, return x)
)

// lets create an instance of the Car object
car := Car clone

// car can now access any of the fields or methods of the Car object
car cleanliness // 100

car drive(150)

car cleanliness // 50

car useWipers

car cleanliness // 80


// But car is also it's own subclasses right now, and we can add fields and methods to it
car price := 25000

car dent := method(price = price - 500)

car fenderBender := method(price = price - 2000)

car crash := method(price = price - 10000)


// We can now use those methods
car price // 25000

car dent

car price // 24500

car crash

car price // 14500


// We can also create a new Object that is a subclass of Car
Supercar := Car clone

// give it new fields and methods
Supercar topSpeed := 200
Supercar topIsDown := false


Supercar convert := method(if(topIsDown, topIsDown = false, topIsDown = true))

// or override fields and methods
Supercar milesPerGallon 5

// As everyone knows, Supercars have super powerful windshield wipers, so it get cleaned much faster
Supercar useWipers := method(
    while(cleanliness < 80,
        "*Squeek* *Squeek* super windshield wipers move back and forth and clean the window" println
        cleanliness = cleanliness + 20
    )
    "Window is clean" println
)

// We can now compare how these two objects interact

car2 := Car clone

ferrari := Supercar clone

car2 cleanliness // 100
ferrari cleanliness // 100

car2 drive(250)
ferrari drive(250)

car2 cleanliness // 50
ferrari cleanliness // 50

car useWipers // loops 6 times
ferrari useWipers // loops 2 times

car2 cleanliness // 80
ferrari cleanliness // 90

// Or use Supercar's new methods

ferrari topIsDown // false

ferrari convert

ferrari topIsDown // true


// Lastly, IO also supports multiple inheritance from an unlimited number of objects
Cat := Object clone

Cat meow := method("Meow" println)

Cat claw := method("Swipe, the cat clawed" println)

Cat bite := method("Chomp, the cat bit" println)


Dog := Object clone

Dog bark := method("Woof" println)

Dog bit := method("Chomp, the dog bit" println)


Snake := Object clone

Snake hiss := method("hssssssss" println)

Snake slither := method("the snake slid on the ground")

Snake bite := method("The snake chomps on its victim")


// We can then clone one of these objects

chimera := Cat clone

// And then use appendProto (or a couple other functions like prependProto) to use multiple inheritance

chimera appendProto(Dog)

// We can now use any of the Dog and Cat specific methods

chimera meow // Meow
chimera bark // Woof
chimera claw // Swipe, the cat clawed

// We can also use any of the methods that they share, in this case bite, and how IO chooses which method to execute is order of the protos
// it always use method of the object that appears earliest in its protos, and since we appended Dog, the protos currently contains Cat
// then Dog so bite is execute Cat's version of the method

chimera bite // Chomp, the cat bit

// However, if we prepend an object the opposite happens

chimera prependProto(Snake)

// chimera's protos how contains Snake, then Cat, then Dog, so bite is execute Snake's version of the method

chimera bite // The snake chomps on its victim

