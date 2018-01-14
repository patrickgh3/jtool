var eventName = argument0;

undoStack[undoStackPos] = eventName;

undoStackPos++;
if( undoStackPos >= undoStackSize ) {
    undoStackPos = 0;
}

if( undoStackPos == undoStackStart ) {
    undoStackStart++;
    if( undoStackStart >= undoStackSize ) {
        undoStackStart = 0;
    }
}

undoStackEnd = undoStackPos;
