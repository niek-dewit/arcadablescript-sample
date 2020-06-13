import "bouncingHeart.arc";
import "millisPerFrame.arc";

screenWidth: Config = ScreenWidth;
screenHeight: Config = ScreenHeight;

// main loop, called number amount of times specified as "mainsPerSecond" in arcadable.config.json
main: Function {
    execute(updateHeart);
}

// render loop, called number amount of times specified as "rendersPerSecond" in arcadable.config.json
render: Function {
    draw.clear;
    execute(drawMillis);
    execute(drawHeart);
    execute(drawPixel);
}

screenWidthMin1: Eval = static screenWidth - 1;
analog0: Analog = 0;
pixelsPerAnalog: Eval = static screenWidthMin1 / 1023;
pixelPos: Eval = pixelsPerAnalog * analog0;

drawPixel: Function {
    draw.drawPixel(255, pixelPos, 10);
}

