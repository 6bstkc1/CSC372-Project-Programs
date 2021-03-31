// Io uses block scoping


// this can be shown like this
// first create a global variable called first

first := 100

// then a method that has a local variable called first
printNum := method(first, first println)

first println // this will print 100, the value of the global first variable
printNum(200) // this will print 200, the value of the local first variable within printNum

// this can also be shown using objects that have fields

Test := Object clone

Test first := 300

Test first println // this prints 300, the local value of the first variable in Test
first println // while this still prints 100, the value of the global first hasn't changed

Test printNum := method(first,
                         "Test printNum" println
                         first println)

Test printNum(400) // this will print Test printNum
// 400, showing not only that first represents a different variable withint the Test printNum method than
// just in the Test object, and that printNum is a different method within the Test object that the global one
