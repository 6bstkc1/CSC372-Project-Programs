//Comments 
//This is a basic inline comment
/*
*	This is a multiline comment
*/


// Printing to the screen
"Hello World" println


/*
*	Mathmatical operator showcase
*/
(2 + 2) println
(2 + (2 * 2)) println
((2 - 2 / 2) % 2) println

/*
*	Variables / assignment operators
*/
a ::= 3	// ::=  Creates a slot, setter and assigns the value
a println
b := 2	// := Creates a slot and assigns the value 
b println 
b = 1	// = Assigns a value to a slot if it exists otherwise raises an exception
b println 

/*
*	Number showcase
*/
123.42 println
0.323 println
123e-4 println
0x0Fe println

/*
*	Booleans + Nil
*/
true println
false println
nil println		// nil is used for unset or missing values

/*
*	String Example
*/
s :=  "Here is a string \t in Io with \"various\" escape characters"

/*
*	If, then, else
*/
if( 2 < 7, true,false)			// The first part compares two integers since 2 is less than 7 it will always print true

if( 8 <= 7, true,false)			// On the flip side, 8 <= is false so this always prints false

if(2 <  7 ) then(true) else (false)	// Alternative form

if(2 < 7) then(1 println) else if(8 <= 7) then(2 println) else (3 println)	// Alternative form with elseif

(2 < 7) ifTrue (true) ifFalse (false)	// Another alternative form

/*
*	Loops
*/

// loop("foobarbaz" println)
// uncomment the line above to run an infinate loop

5 repeat("foo" println)	// the repeat() method can be used for loops, in this case it's used print foo 5 times

// A basic while loop that prints bar 7 times
i := 7
while(i >= 0,
	"bar" println
	i = i - 1
)

// A basic for loop that prints baz 4 times
for(j, 0, 12, 4, "baz" println)

// A for loop with break and continue statements
for(i, 1, 10, 
    if(i >  7, continue)
    if(i == 9, break)
    i print
)


/*
*	Object showcase
*/
/*Cat := Object clone 				// Creating  Cat object which is a subclass of object
 *Cat color ::= "Black"				// Giving cat a instance variable notice the ::= operator which allows us to change this later
* Cat  meow := method("Meow!!" println)		// Giving cat a method
 *Garfield := Cat clone setColor("Orange")		// Creating a Garfield Object and changing its color 
*/

// creates a Cat with color, age, meow(), ageUp()
Cat := Object clone
Cat color ::= "Black"
Cat age ::= 0
Cat meow := method("Meow!!" println)
Cat ageUp := method(age=age+1 println)

// Garfield is of type Cat
Garfield := Cat clone setColor("Orange") setAge(9)

/*Type these commands to use the Objects*/
// Cat meow
// Cat ageUp
// Garfield meow
// Garfield ageUp





