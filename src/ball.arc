

centerX: Eval = static screenWidth / 2;
centerY: Eval = static screenHeight / 2;

ballStartSpeed: Number = 0.1;
ballStartSpeedNegative: Eval = static ballStartSpeed * -1; 
ballMaxSpeed: Number = 0.6;
ballSpeedAdd: Number = 0.05;
ballDeflectionMultiplier: Eval = actualNewBallSpeed * 1;

ballX: Number = 15;
ballY: Number = 5;
ballH: Number = 0.1;
ballV: Number = 0.1;

ballHSquared: Eval = ballH pow 2;
ballVSquared: Eval = ballV pow 2;
ballHSquaredPlusballVSquared: Eval = ballHSquared + ballVSquared;
ballSpeed: Eval = ballHSquaredPlusballVSquared pow 0.5;

ballHNormalized: Eval = ballH / ballSpeed;
ballVNormalized: Eval = ballV / ballSpeed;

possibleNewBallSpeed: Eval = ballSpeed + ballSpeedAdd;
actualNewBallSpeed: Number = 0;
newBallHSpeed: Eval = ballHNormalized * actualNewBallSpeed;
newBallVSpeed: Eval = ballVNormalized * actualNewBallSpeed;

ballHPositive: Number = 0;
ballVPositive: Number = 0;
ballHNegative: Number = 0;
ballVNegative: Number = 0;
hitBallHPositive: Number = 0;
hitBallVPositive: Number = 0;
hitBallHNegative: Number = 0;
hitBallVNegative: Number = 0;

stepBall: Function {
    if (possibleNewBallSpeed > ballMaxSpeed) {
        actualNewBallSpeed = ballMaxSpeed;
    } else {
        actualNewBallSpeed = possibleNewBallSpeed;
    }

    if(ballH > 0) {
        ballHPositive = ballH;
        ballHNegative = ballH * -1;
        hitBallHPositive = newBallHSpeed;
        hitBallHNegative = newBallHSpeed * -1;
    } else {
        ballHPositive = ballH * -1;
        ballHNegative = ballH;
        hitBallHPositive = newBallHSpeed * -1;
        hitBallHNegative = newBallHSpeed;
    }
    if(ballV > 0) {
        ballVPositive = ballV;
        ballVNegative = ballV * -1;
        hitBallVPositive = newBallVSpeed;
        hitBallVNegative = newBallVSpeed * -1;
    } else {
        ballVPositive = ballV * -1;
        ballVNegative = ballV;
        hitBallVPositive = newBallVSpeed * -1;
        hitBallVNegative = newBallVSpeed;
    }

    ballX = ballX + ballH;
    ballY = ballY + ballV;
    ballCollides = 0;
    if(ballX >= screenWidthMin3) {
        if(player2Lives > 0) {
            setPlayerNumber = 1;
            execute(setCurrentPlayerPosition);
            ballPosition = ballY;
            execute(doesBallCollide);
            if(ballCollides == 1) {
                ballH = hitBallHNegative;
                ballV = ballV - ballDeflection;
            }
        }
    }
    if(ballX >= screenWidthMin1) {
        if(player2Lives == 0) {
            ballH = ballHNegative;
        } else {
            if(ballX >= screenWidth) {
                player2Lives = player2Lives - 1;
                execute(scored);
            }
        }
    }
    if(ballX <= 3) {
        if(player4Lives > 0) {
            setPlayerNumber = 3;
            execute(setCurrentPlayerPosition);
            ballPosition = ballY;
            execute(doesBallCollide);
            if(ballCollides == 1) {
                ballH = hitBallHPositive;
                ballV = ballV + ballDeflection;
            }
        }
    }
    if(ballX <= 1) {
        if(player4Lives == 0) {
            ballH = ballHPositive;
        } else {
            if(ballX <= 0) {
                player4Lives = player4Lives - 1;
                execute(scored);
            }
        }
    }
    if(ballY >= screenHeightMin3) {
        if(player3Lives > 0) {
            setPlayerNumber = 2;
            execute(setCurrentPlayerPosition);
            ballPosition = ballX;
            execute(doesBallCollide);
            if(ballCollides == 1) {
                ballV = hitBallVNegative;
                ballH = ballH + ballDeflection;
            }
        }
    }
    if (ballY >= screenHeightMin1) {
        if (player3Lives == 0) {
            ballV = ballVNegative;
        } else {
            if(ballY >= screenHeight) {
                player3Lives = player3Lives - 1;
                execute(scored);
            }
        }
    }
    if(ballY <= 3) {
        if(player1Lives > 0) {
            setPlayerNumber = 0;
            execute(setCurrentPlayerPosition);
            ballPosition = ballX;
            execute(doesBallCollide);
            if(ballCollides == 1) {
                ballV = hitBallVPositive;
                ballH = ballH - ballDeflection;
            }
        }        
    }
    if (ballY <= 1) {
        if (player1Lives == 0) {
            ballV = ballVPositive;
        } else {
            if(ballY <= 0) {
                player1Lives = player1Lives - 1;
                execute(scored);
            }
        }
    }

    if (ballCollides == 1) {
        ballH = ballHNormalized * actualNewBallSpeed;
        ballV = ballVNormalized * actualNewBallSpeed;    
    }
}

drawBall: Function {
    draw.setRotation(0);
    draw.drawPixel(16777215, ballX, ballY);
}

resetBall: Function {
    ballX = centerX;
    ballY = centerY;
    ballH = 0;
    ballV = 0;
}