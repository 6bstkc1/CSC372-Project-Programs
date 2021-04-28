// Implementation of tic tac toe using Io

doFile("tictactoe.io") // import the board

Controller := Object clone

Controller hasWon := 0 // used see when the game is over and who won

Controller player1 := Player clone
Controller player2 := Player clone

// takes a player and sets its name to a user input
Controller getName := method(player,
    player = File standardInput readLine)

// This program gets two player's names, prints and board, and alternates
// asking each of them to make a move until the game is over
Controller startGame := method(
    board = board clone
    // reset the board and who has won in case multiple games are played in a row
    board reset
    hasWon = 0
    
    // get names for both players
    "Enter player 1's name: " print
    player1 name = getName(player1)
    "Enter player 2's name: " print
    player2 name = getName(player2)

    currentMove := ""
    validMove := false
    notTaken := false
    while(hasWon == 0,
        // print board
        board draw
        
        while(validMove == false or notTaken == false,
            (player1 name .. " enter a number between 0 and 8 to move") println
            currentMove = File standardInput readLine
            
            if(currentMove asNumber >= 0 and currentMove asNumber <= 8, // check to see if user entered a number between 0 and 8
                validMove = true)
            
            notTaken = board put("x", currentMove asNumber) // check that the spot on the board is not taken
            
        )
        validMove = false
        
        hasWon = board check // check if someone has won
        
        if(hasWon != 0,
            break)
        
        // Do the same thing for player 2
        board draw
        while(validMove == false or notTaken == false,
            (player2 name .. " enter a number between 0 and 8 to move") println
            currentMove = File standardInput readLine
            
            if(currentMove asNumber >= 0 and currentMove asNumber <= 8,
                validMove = true)
            
            notTaken = board put("o", currentMove asNumber)
        
        )
        validMove = false
        
        hasWon = board check // check if someone has won
    )
    
    board draw
    
    if(hasWon == 1) then(("Congratulations " .. player1 name .. " you won!") println) elseif(hasWon == 2) then(("Congratulations " .. player2 name .. " you won!") println) elseif(hasWon == 3) then("Cat's game, no one won" println)
    
    

)
