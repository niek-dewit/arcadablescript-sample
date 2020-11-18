import "ball.arc";
import "arena.arc";
import "player.arc";
import "heart.arc";
import "game.arc";
import "menu.arc";

screenWidth: Config = ScreenWidth;
screenHeight: Config = ScreenHeight;
screenWidthMin1: Eval = static screenWidth - 1;
screenWidthMin3: Eval = static screenWidth - 3;
screenHeightMin1: Eval = static screenHeight - 1;
screenHeightMin3: Eval = static screenHeight - 3;

player1PrimaryColor: Number = 16749568;
player1SecondaryColor: Number = 1707776;
player2PrimaryColor: Number = 11796224;
player2SecondaryColor: Number = 1186304;
player3PrimaryColor: Number = 35327;
player3SecondaryColor: Number = 3354;
player4PrimaryColor: Number = 16711841;
player4SecondaryColor: Number = 1703952;

inMenu: Number = 1;
millisAtWin: Number = -1;
timeSinceWin: Eval = currentMillis - millisAtWin;
pikaWidth: Number = 20;
pikaHeight: Number = 20;
pikaX: Number = 10;
pikaY: Number = 0;
//pika: Image = ['assets/pika.data', pikaWidth, pikaHeight, 7434609];
pikaMaxX: Eval = static screenWidth - pikaWidth;
pikaMaxY: Eval = static screenHeight - pikaHeight;
pikaH: Number = 0.01;
pikaV: Number = 0.01;

main: Function {

    if(inMenu == 0) {
        execute(stepGame);
    }

   // pikaX = pikaX + pikaH;
   // pikaY = pikaY + pikaV;
   // if(pikaX > pikaMaxX) {
    //    pikaH = -0.04;
   // }
   // if(pikaX < 0) {
    //    pikaH = 0.04;
   // }
   // if(pikaY > pikaMaxY) {
    //    pikaV = -0.04;
   // }
   // if(pikaY < 0) {
   //     pikaV = 0.04;
   // }
}

render: Function {

    draw.clear;
    if(inMenu == 0) {
        execute(drawGame);
    } else {
        if(inMenu == 1) {
            execute(drawMenu);
        } else {
            if(timeSinceWin > 2000) {
                inMenu = 1;
            }

            if(inMenu == 2) {
                setPlayerNumber = 0;
                execute(drawPlayerWin);
            } else {
                if(inMenu == 3) {
                    setPlayerNumber = 1;
                    execute(drawPlayerWin);
                } else {
                    if(inMenu == 4) {
                        setPlayerNumber = 2;
                        execute(drawPlayerWin);
                    } else {
                        if(inMenu == 5) {
                            setPlayerNumber = 3;
                            execute(drawPlayerWin);
                        }
                    }
                }
            }
        }
    }
    draw.setRotation(0);
    //draw.drawImage(pikaX, pikaY, pika);
}
