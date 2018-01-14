while( true ) {
    if( undoStackPos == undoStackEnd ) {
        break;
    }
    
    var currentCommand = undoStack[undoStackPos];
    
    undoStackPos++;
    if( undoStackPos >= undoStackSize ) {
        undoStackPos = 0;
    }
    
    var currentUndoCommand = string_copy( currentCommand, 1, 1 );
    var undoCommandLength = string_length( currentCommand );
    if( undoCommandLength == 1 ) {
        continue;
    }
    var undoArgs = string_copy( currentCommand, 2, undoCommandLength - 1 );

    switch( currentUndoCommand ) {
       case 'c':
           redoCreate( undoArgs );
           break;
        case 'm':
           redoMove( undoArgs );
           break;
       case 'd':
            redoDestroy( undoArgs );
           break;
       default:
            break;
    }
    
    break;
}
