/*
HOW TO PLAY
commands:
	board draw
		this will show the current state of the game as a ascii board
		"e" is an empty space on the board

	board check
		this command looks to see if a player has won, either x's or o's or tie or not finished
		0 -> game not finished
		1 -> x wins
		2 -> o wins
		3 -> tie

	board put(<mark>, <spot>)
		this is how you place x's or o's on the board, (must be lowercase "x" or "o") 
		0 | 1 | 2
		---------
		3 | 4 | 5
		---------
		6 | 7 | 8
		spots are arranged like this
		Example: board put("x", 1)
*/

board := list clone 
for(i,0,8,
	board append("e")
)

board draw := method(
	println
	for(i,0,6,3, 
		"    "print
		board at(i) print
		"    |  " print
		board at(i+1) print
		"  |    " print
		board at(i+2) print
		"    "println
		if(i != 6,"---------------------------" println, "" println)
	)
)

board check := method(

	xwins := false
	owins := false
	tie := false

	if( (board at(0) == "x" and board at(3) == "x" and board at(6) == "x") or
		(board at(1) == "x" and board at(4) == "x" and board at(7) == "x") or
		(board at(2) == "x" and board at(5) == "x" and board at(8) == "x") or 
		(board at(0) == "x" and board at(1) == "x" and board at(2) == "x") or 
		(board at(3) == "x" and board at(4) == "x" and board at(5) == "x") or
		(board at(6) == "x" and board at(7) == "x" and board at(8) == "x") or 
		(board at(0) == "x" and board at(4) == "x" and board at(8) == "x") or
		(board at(6) == "x" and board at(4) == "x" and board at(2) == "x"), 
		xwins := true)

	if( (board at(0) == "o" and board at(3) == "o" and board at(6) == "o") or
		(board at(1) == "o" and board at(4) == "o" and board at(7) == "o") or
		(board at(2) == "o" and board at(5) == "o" and board at(8) == "o") or 
		(board at(0) == "o" and board at(1) == "o" and board at(2) == "o") or 
		(board at(3) == "o" and board at(4) == "o" and board at(5) == "o") or
		(board at(6) == "o" and board at(7) == "o" and board at(8) == "o") or 
		(board at(0) == "o" and board at(4) == "o" and board at(8) == "o") or
		(board at(6) == "o" and board at(4) == "o" and board at(2) == "o"), 
		owins := true)

	if( board at(0) != "e" and board at(1) != "e" and board at(2) != "e" and
		board at(3) != "e" and board at(4) != "e" and board at(5) != "e" and
		board at(6) != "e" and board at(7) != "e" and board at(8) != "e",
		tie := true)

	if(xwins,
		return 1
	)

	if(owins,
		return 2
	)

	if(tie,
		return 3
	)

	return 0
)

/*	
	if the spot is empty
		put mark in a spot 
		return true
	else
		return false
*/
board put := method(mark, spot, 
	if(board at(spot) == "e",
		board atPut(spot, mark)
		return true,
		return false
	)
)

board reset := method(
	for(i,0,8,
        board atPut(i, "e")
    )
)


