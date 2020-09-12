playerLives: Number = 3;

player1Lives: Number = 1;
player2Lives: Number = 1;
player3Lives: Number = 1;
player4Lives: Number = 1;

player1ContinueButton: Digital = 1;
player2ContinueButton: Digital = 5;
player3ContinueButton: Digital = 9;
player4ContinueButton: Digital = 13;
player1Continue: Number = 0;
player2Continue: Number = 0;
player3Continue: Number = 0;
player4Continue: Number = 0;

running: Number = 0;

currentMillis: Config = CurrentMillis;
randomWeird: Eval = currentMillis % 33; 
random1: Eval = currentMillis % 2;
random2: Eval = randomWeird % 2;

stepGame: Function {
    
    if(running == 0) {
        execute(notRunningGameStep);
    } else {
        execute(runningGameStep);
    }
}


notRunningGameStep: Function {
    player1Continue = 0;
    player2Continue = 0;
    player3Continue = 0;
    player4Continue = 0;

    if(player1Lives > 0) {
        if(player1ContinueButton == 1) {
            player1Continue = 1;
        } else {
            player1Continue = 0;
        }             
    } else {
        player1Continue = 1;
    }
    if(player2Lives > 0) {
        if(player2ContinueButton == 1) {
            player2Continue = 1;
        } else {
            player2Continue = 0;
        }         
    } else {
        player2Continue = 1;
    }
    if(player3Lives > 0) {
        if(player3ContinueButton == 1) {
            player3Continue = 1;
        } else {
            player3Continue = 0;
        }         
    } else {
        player3Continue = 1;
    }
    if(player4Lives > 0) {
        if(player4ContinueButton == 1) {
            player4Continue = 1;
        } else {
            player4Continue = 0;
        }         
    } else {
        player4Continue = 1;
    }
    if(player1Continue == 1) {
        if(player2Continue == 1) {
            if(player3Continue == 1) {
                if(player4Continue == 1) {
                    execute(startRunning);
                }
            }
        }
    }
}

startRunning: Function {
    running = 1;
    if(random1 == 0) {
        if(random2 == 0) {
            if(player2Lives > 0) {
                ballH = ballStartSpeed;
            } else {
                if(player4Lives > 0) {
                    ballH = ballStartSpeedNegative;
                } else {
                    if(player3Lives > 0) {
                        ballV = ballStartSpeed;
                    } else {
                        ballV = ballStartSpeedNegative;
                    }
                }
            }
        } else {
            if(player4Lives > 0) {
                ballH = ballStartSpeedNegative;
            } else {
                if(player2Lives > 0) {
                    ballH = ballStartSpeed;
                } else {
                    if(player1Lives > 0) {
                        ballV = ballStartSpeedNegative;
                    } else {
                        ballV = ballStartSpeed;
                    }
                }
            }
        }
    } else {
        if(random2 == 0) {
            if(player3Lives > 0) {
                ballV = ballStartSpeed;
            } else {
                if(player1Lives > 0) {
                    ballV = ballStartSpeedNegative;
                } else {
                    if(player2Lives > 0) {
                        ballH = ballStartSpeed;
                    } else {
                        ballH = ballStartSpeedNegative;
                    }
                }
            }
        } else {
            if(player1Lives > 0) {
                ballV = ballStartSpeedNegative;
            } else {
                if(player3Lives > 0) {
                    ballV = ballStartSpeed;
                } else {
                    if(player4Lives > 0) {
                        ballH = ballStartSpeedNegative;
                    } else {
                        ballH = ballStartSpeed;
                    }
                }
            }
        }
    }
}
runningGameStep: Function {
    execute(stepBall);

}

drawGame: Function {
    if(running == 0) {
        execute(notRunningGameDraw);
    } else {
        execute(runningGameDraw);
    }
}

runningGameDraw: Function {
    execute(drawArena);
     
    if(player1Lives > 0) {
        setPlayerNumber = 0;
        setPlayerLives = player1Lives;
        execute(drawPlayerHearts);
    }
    if(player2Lives > 0) {
        setPlayerNumber = 1;
        setPlayerLives = player2Lives;
        execute(drawPlayerHearts);
    }
    if(player3Lives > 0) {
        setPlayerNumber = 2;
        setPlayerLives = player3Lives;
        execute(drawPlayerHearts);
    }
    if(player4Lives > 0) {
        setPlayerNumber = 3;
        setPlayerLives = player4Lives;
        execute(drawPlayerHearts);
    }

    if(player1Lives > 0) {
        setPlayerNumber = 0;
        execute(drawPlayer);
    }
    if(player2Lives > 0) {
        setPlayerNumber = 1;
        execute(drawPlayer);
    }
    if(player3Lives > 0) {
        setPlayerNumber = 2;
        execute(drawPlayer);
    }
    if(player4Lives > 0) {
        setPlayerNumber = 3;
        execute(drawPlayer);
    }
    execute(drawBall);
}
notRunningGameDraw: Function {
    execute(runningGameDraw);

    if(player1Continue == 0) {
        draw.setRotation(0);
        draw.drawRect(16711680, centerX, 7, centerX, 9);
    }
    if(player2Continue == 0) {
        draw.setRotation(1);
        draw.drawRect(16711680, centerX, 7, centerX, 9);
    }
    if(player3Continue == 0) {
        draw.setRotation(2);
        draw.drawRect(16711680, centerX, 7, centerX, 9);
    }
    if(player4Continue == 0) {
        draw.setRotation(3);
        draw.drawRect(16711680, centerX, 7, centerX, 9);
    }
}

resetGame: Function {
    execute(resetBall);
    player1Lives = playerLives;
    player2Lives = playerLives;
    player3Lives = playerLives;
    player4Lives = playerLives;
}
playersPlaying: Number = 4;
scored: Function {
    execute(resetBall);
    running = 0;
    playersPlaying = 4;
    if(player1Lives == 0) {
        playersPlaying = playersPlaying - 1;
    }
    if(player2Lives == 0) {
        playersPlaying = playersPlaying - 1;
    }
    if(player3Lives == 0) {
        playersPlaying = playersPlaying - 1;
    }
    if(player4Lives == 0) {
        playersPlaying = playersPlaying - 1;
    }
    if(playersPlaying == 1) {
        if(player1Lives > 0) {
            inMenu = 2;
            execute(playerWon);
        } else {
            if(player2Lives > 0) {
                inMenu = 3;
                execute(playerWon);
            } else {
                if(player3Lives > 0) {
                    inMenu = 4;
                    execute(playerWon);
                } else {
                    if(player4Lives > 0) {
                        inMenu = 5;
                        execute(playerWon);
                    }
                }
            }
        }
    }
}

playerWon: Function {
    running = 0;
    millisAtWin = currentMillis;
    execute(resetGame);
}