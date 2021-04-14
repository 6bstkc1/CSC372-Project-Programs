/*
*	This is the first program of the CSC372 project.
*	This program simulates various aspects of a car including
*	driving, managing the gas tank, cleaning the windshield etc.
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

