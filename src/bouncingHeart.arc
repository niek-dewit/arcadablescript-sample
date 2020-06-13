screenWidthMinHeartWidth: Eval = static screenWidth - heartWidth;
screenHeightMinHeartHeight: Eval = static screenHeight - heartHeight;

hSpeed: Number = 0.3;
vSpeed: Number = 0.3;

heartX: Number = 0;
heartY: Number = 0;
heartX1: Eval = heartX + 1;
heartX2: Eval = heartX + 2;
heartX3: Eval = heartX + 3;
heartX4: Eval = heartX + 4;
heartX5: Eval = heartX + 5;
heartX6: Eval = heartX + 6;
heartY1: Eval = heartY + 1;
heartY2: Eval = heartY + 2;
heartY3: Eval = heartY + 3;
heartY4: Eval = heartY + 4;
heartY5: Eval = heartY + 5;
heartSpeed: Number = 0.2;
heartWidth: Number = 7;
heartHeight: Number = 6;

updateHeart: Function {
    if (heartX >= screenWidthMinHeartWidth) {
        hSpeed = 0 - heartSpeed;
    }
    
    if (heartX <= 0) {
        hSpeed = 0 + heartSpeed;
    }

    if (heartY >= screenHeightMinHeartHeight) {
        vSpeed = 0 - heartSpeed;
    }
    
    if (heartY <= 0) {
        vSpeed = 0 + heartSpeed;
    }

    heartX = heartX + hSpeed;
    heartY = heartY + vSpeed;
}

drawHeart: Function {

    draw.fillTriangle(2368548, heartX, heartY2, heartX6, heartY2, heartX3, heartY5);
    draw.fillTriangle(5701632, heartX1, heartY2, heartX5, heartY2, heartX3, heartY4);
    draw.drawLine(2368548, heartX, heartY1, heartX6, heartY1);
    draw.drawLine(5701632, heartX1, heartY1, heartX2, heartY1);
    draw.drawLine(5701632, heartX4, heartY1, heartX5, heartY1);
    draw.drawLine(2368548, heartX1, heartY, heartX2, heartY);
    draw.drawLine(2368548, heartX4, heartY, heartX5, heartY);
}

