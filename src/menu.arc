player1Join: Digital = 2;
player2Join: Digital = 6;
player3Join: Digital = 10;
player4Join: Digital = 14;

player1Joined: Number = 0;
player2Joined: Number = 0;
player3Joined: Number = 0;
player4Joined: Number = 0;

textHeight: Eval = static screenHeight - 9;
buttonHeight: Eval = static textHeight - 3;
textLeft: Eval = static centerX - 12;

joinText: String = "Join";

stepMenu: Function {

}

joined: Number = 0;
lastJoinedMillis: Number = 0;
timeSinceLastJoined: Eval = currentMillis - lastJoinedMillis;
millisUntilStart: Eval = 1000 - timeSinceLastJoined;
pixelsPerMillis: Eval = static screenWidth / 1000;
inversedTimePixels: Eval = millisUntilStart * pixelsPerMillis;
timePixels: Eval = screenWidth - inversedTimePixels; 
timeLineHeight: Eval = static screenHeight - 1;

drawMenu: Function {

    if(player1Join == 0) {
        draw.setRotation(2);
        execute(drawJoin);
        if(player1Joined == 1) {
            execute(playerLeft);
            player1Joined = 0;
        }
    } else {
        if(player1Joined == 0) {
            execute(playerJoined);
            player1Joined = 1;
        }
    }
    if(player2Join == 0) {
        draw.setRotation(3);
        execute(drawJoin);
        if(player2Joined == 1) {
            execute(playerLeft);
            player2Joined = 0;
        }
    } else {
        if(player2Joined == 0) {
            execute(playerJoined);
            player2Joined = 1;
        }
    }
    if(player3Join == 0) {
        draw.setRotation(4);
        execute(drawJoin);
        if(player3Joined == 1) {
            execute(playerLeft);
            player3Joined = 0;
        }
    } else {
        if(player3Joined == 0) {
            execute(playerJoined);
            player3Joined = 1;
        }
    }
    if(player4Join == 0) {
        draw.setRotation(5);
        execute(drawJoin);
        if(player4Joined == 1) {
            execute(playerLeft);
            player4Joined = 0;
        }
    } else {
        if(player4Joined == 0) {
            execute(playerJoined);
            player4Joined = 1;
        }
    }
    if (joined > 1) {
 
        if(player1Joined == 1) {
            draw.setRotation(2);
            draw.drawLine(player1SecondaryColor, 0, timeLineHeight, timePixels, timeLineHeight)
        }
        if(player2Joined == 1) {
            draw.setRotation(3);
            draw.drawLine(player2SecondaryColor, 0, timeLineHeight, timePixels, timeLineHeight)
        }
        if(player3Joined == 1) {
            draw.setRotation(4);
            draw.drawLine(player3SecondaryColor, 0, timeLineHeight, timePixels, timeLineHeight)
        }
        if(player4Joined == 1) {
            draw.setRotation(5);
            draw.drawLine(player4SecondaryColor, 0, timeLineHeight, timePixels, timeLineHeight)
        }
        if(millisUntilStart < 0) {
            inMenu = 0;
            execute(resetGame);
            if(player1Joined == 0) {
                player1Lives = 0;
            }
            if(player2Joined == 0) {
                player2Lives = 0;    
            }
            if(player3Joined == 0) {
                player3Lives = 0;    
            }
            if(player4Joined == 0) {
                player4Lives = 0;    
            }
        }
    }
    
}
playerJoined: Function {
    joined = joined + 1;
    lastJoinedMillis = currentMillis;
}
playerLeft: Function {
    joined = joined - 1;
    lastJoinedMillis = currentMillis;
}
drawJoin: Function {

    draw.drawText(3355443, 1, joinText, textLeft, textHeight);
    draw.drawRect(255, centerX, buttonHeight, centerX, buttonHeight);
}

