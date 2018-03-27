var expandStr = argument0;

var prevStackPos = undoStackPos - 1;
if( prevStackPos < 0 ) {
    prevStackPos = undoStackSize - 1;
}
undoStack[prevStackPos] += expandStr;
