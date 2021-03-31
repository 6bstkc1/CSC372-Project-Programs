/*
* lists in io are passed by reference the paramter in the method change() uses the reference of the list and therefore changes the list
*/
xList := List clone append(1, 2, 3, 4)
("before change method: " .. xList) println
change := method(d,
	d atPut(1, 1000)
	d println
)
change(xList)
("after change method: " .. xList) println

/*
*	Concurrency via Actors and Coroutines
*
*	Because Io is designed around messages that get passed to receivers, concurrency ends up being quite simple. Prefixing a message with @ returns a future. Prefixing a message with 
*	@@ dispatches the message to execute on a separate thread.
*/
thread1 := Object clone
thread1 numbers := method(
	"1a" println
	yield
	"1b" println
	yield
)

thread2 := Object clone
thread2 numbers := method(
	"2a" println
	yield
	"2b" println
	yield
)

thread3 := Object clone
thread3 numbers := method(
	"3a" println
	yield
	"3b" println
	yield
)

thread4 := Object clone
thread4 numbers := method(
	"4a" println
	yield
	"4b" println
	yield
)

thread1 @@numbers
thread2 @@numbers
thread3 @@numbers
thread4 @@numbers

Coroutine currentCoroutine pause

