arenaScreenWidth: Config = ScreenWidth;
arenaScreenHeight: Config = ScreenHeight;
arenaScreenWidthMin1: Eval = static arenaScreenWidth - 1;
arenaScreenHeightMin1: Eval = static arenaScreenHeight - 1;
drawArena: Function {
    draw.setRotation(0);
    draw.drawLine(player1SecondaryColor, 0, 0, arenaScreenWidthMin1, 0);
    draw.drawLine(player4SecondaryColor, 0, 0, 0, arenaScreenHeightMin1);
    draw.drawLine(player3SecondaryColor, 0, arenaScreenHeightMin1, arenaScreenWidthMin1, arenaScreenHeightMin1);
    draw.drawLine(player2SecondaryColor, arenaScreenWidthMin1, arenaScreenHeightMin1, arenaScreenWidthMin1, 0);
}