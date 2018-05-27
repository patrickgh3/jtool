while( true ) {
    if( undoStackPos == undoStackStart ) {
        break;
    }
    
    undoStackPos--;
    if( undoStackPos < 0 ) {
        undoStackPos = undoStackSize - 1;
    }
        
    var currentUndoCommand = string_copy( undoStack[undoStackPos], 1, 1 );
    var undoCommandLength = string_length( undoStack[undoStackPos] );
    if( undoCommandLength == 1 ) {
        continue;
    }
    var undoArgs = string_copy( undoStack[undoStackPos], 2, undoCommandLength - 1 );
        
    switch( currentUndoCommand ) {
        case 'c':
            undoCreate( undoArgs );
            break;
        case 'm':
           undoMove( undoArgs );
           break;
        case 'd':
           undoDestroy( undoArgs );
           break;
        default:
           break;
    }
    
    break;
}
