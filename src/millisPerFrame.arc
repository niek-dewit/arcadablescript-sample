currMillis: Config = CurrentMillis;
prevRenderMillis: Number = 0;
diffRenderMillis: Eval = currMillis - prevRenderMillis;

textToDraw: List<Number> = [48, 48];
firstCharPointer: ListValue = textToDraw[0];
secondCharPointer: ListValue = textToDraw[1];

diffsIndex: Number = 0;
diffs: List<Number> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
diffsPointer: ListValue = diffs[diffsIndex];

drawMillis: Function {

    diffsPointer = diffRenderMillis;
    diffsIndex = diffsIndex + 1;

    if (diffsIndex == 10) {
        diffsIndex = 0;
        execute(calculateAverage);
        diffsIndex = 0;

        firstCharPointer = 48 + averageFramesDiv10;
        secondCharPointer = 48 + averageFramesMod10;
    }
    draw.drawText(123456, 2, textToDraw, 0, 0);
    prevRenderMillis = currMillis;
}

averageFramesDiv10: Eval = averageDiffs / 10;
averageFramesMod10: Eval = averageDiffs % 10;
averageDiffs: Number = 0;
calculateAverage: Function {
    averageDiffs = averageDiffs + diffsPointer;
    diffsIndex = diffsIndex + 1;
    if (diffsIndex < 10) {
        execute(calculateAverage);
    } else {
        averageDiffs = averageDiffs / 10;
    }
}