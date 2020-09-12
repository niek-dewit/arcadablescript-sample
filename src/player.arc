
paddleWidth: Number = 6;
halfPaddleWidth: Eval = static paddleWidth / 2;
paddleWidthPlus1: Eval = static paddleWidth + 1;
halfPaddleWidthPlus1: Eval = static paddleWidthPlus1 / 2;

heartHeight: Eval = static screenHeight - 8;

playerColors: List<Number> = [player1PrimaryColor, player2PrimaryColor, player3PrimaryColor, player4PrimaryColor];
playerSecondaryColors: List<Number> = [player1SecondaryColor, player2SecondaryColor, player3SecondaryColor, player4SecondaryColor];

player4PosInput: Analog = 6;
player3PosInput: Analog = 4;
player2PosInput: Analog = 2;
player1PosInput: Analog = 0;

currentPlayerColor: ListValue = playerColors[setPlayerNumber];
currentPlayerSecondaryColor: ListValue = playerSecondaryColors[setPlayerNumber];

currentPaddleLeftPosition: Eval = setPlayerPosition - halfPaddleWidth;
currentPaddleRightPosition: Eval = setPlayerPosition + halfPaddleWidth;
realPaddleLeftPosition: Eval = currentPaddleLeftPosition - 1;
realPaddleRightPosition: Eval = currentPaddleRightPosition - 1;
checkPaddleLeftPosition: Eval = currentPaddleLeftPosition + checkLeftOffset;
checkPaddleRightPosition: Eval = currentPaddleRightPosition + checkRightOffset;
checkLeftOffset: Number = 0;
checkRightOffset: Number = 0;

pixelsPerAnalog: Eval = static screenWidth / 1023;

setPlayerNumber: Number = 0;
setPlayerPosition: Number = 0;
setPlayerLives: Number = 0;
drawPlayer: Function {
    draw.setRotation(setPlayerNumber);
    execute(setCurrentPlayerPosition);
    draw.drawLine(currentPlayerColor, realPaddleLeftPosition, 2, realPaddleRightPosition, 2);
}
drawPlayerHearts: Function {
    draw.setRotation(setPlayerNumber);
    execute(drawPlayerHeartsRecursive);
}
drawPlayerHeartsRecursive: Function {
    if(setPlayerLives > 0) {
        heartXpos = 8 * setPlayerLives;
        heartXpos = heartXpos - 7;
        execute(drawHeart);
        setPlayerLives = setPlayerLives - 1;
        execute(drawPlayerHearts);
    }
}

setCurrentPlayerPosition: Function {
    if (setPlayerNumber == 0) {
        setPlayerPosition = player1PosInput * pixelsPerAnalog;
        setPlayerPosition = setPlayerPosition + 1;
        checkLeftOffset = -2;
        checkRightOffset = -1;
    }
    if (setPlayerNumber == 1) {
        setPlayerPosition = player2PosInput * pixelsPerAnalog;
        setPlayerPosition = setPlayerPosition + 1;
        checkLeftOffset = -2;
        checkRightOffset = -1;
    }
    if (setPlayerNumber == 2) {
        setPlayerPosition = player3PosInput * pixelsPerAnalog;
        checkLeftOffset = 0;
        checkRightOffset = 1;
    }
    if (setPlayerNumber == 3) {
        setPlayerPosition = player4PosInput * pixelsPerAnalog;
        checkLeftOffset = 0;
        checkRightOffset = 1;
    }    
}


ballCollides: Number = 0;
ballPosition: Number = 0;
ballHitOffset: Number = 0;
ballDeflection: Eval = ballHitOffset * ballDeflectionMultiplier;
doesBallCollide: Function {
    execute(setCurrentPlayerPosition);
    if (ballPosition < checkPaddleLeftPosition) {
        ballCollides = 0;
    } else {
        if (ballPosition > checkPaddleRightPosition) {
            ballCollides = 0;
        } else {
            ballCollides = 1;
            ballHitOffset = setPlayerPosition - ballPosition;
            ballHitOffset = ballHitOffset + checkRightOffset;
            ballHitOffset = ballHitOffset - 0.5;
            ballHitOffset = ballHitOffset / halfPaddleWidthPlus1;
        }
    }
}
winText: String = 'Winner';
centerXMinSome: Eval = static centerX - 17;
centerXMin1: Eval = static centerX - 3;
playerWinRotation: Eval = setPlayerNumber + 2;
drawPlayerWin: Function {
    draw.setRotation(playerWinRotation);
    draw.fillRect(currentPlayerSecondaryColor, 0, 0, screenWidth, screenHeight);
    draw.fillCircle(0, centerX, centerX, centerX);
    draw.drawRect(currentPlayerSecondaryColor, 0, 0, screenWidth, screenHeight);
    draw.drawText(currentPlayerSecondaryColor, 1, winText, centerXMinSome, centerXMin1);
}