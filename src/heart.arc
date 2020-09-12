heartXpos: Number = 10;
heartYpos: Number = 1;
heartOuterColor: Number = 328965;
heartInnerColor: Number = 327680;

x0: Eval = heartXpos + 0; 
x1: Eval = heartXpos + 1;
x2: Eval = heartXpos + 2;
x3: Eval = heartXpos + 3;
x4: Eval = heartXpos + 4;
x5: Eval = heartXpos + 5;
x6: Eval = heartXpos + 6;
x7: Eval = heartXpos + 7;

y0: Eval = heartYpos + 0; 
y1: Eval = heartYpos + 1;
y2: Eval = heartYpos + 2;
y3: Eval = heartYpos + 3;
y4: Eval = heartYpos + 4;
y5: Eval = heartYpos + 5;

drawHeart: Function {
    
    draw.drawRect(heartOuterColor, x0, y4, x7, y4);
    draw.fillRect(heartInnerColor, x1, y4, x6, y3);
    draw.drawLine(heartOuterColor, x1, y5, x2, y5);
    draw.drawLine(heartOuterColor, x4, y5, x5, y5);
    draw.drawLine(heartOuterColor, x1, y2, x3, y0);
    draw.drawLine(heartOuterColor, x3, y0, x5, y2);
    draw.drawPixel(heartInnerColor, x3, y1);
    draw.drawPixel(heartOuterColor, x3, y4);


}