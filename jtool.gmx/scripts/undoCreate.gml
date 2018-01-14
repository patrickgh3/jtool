var objectsStr = argument0;

for( var i = 0; i < string_length( objectsStr ); i += 9 ) {
    var instanceX = real( string_copy( objectsStr, i + 1, 3 ) ) + 32;
    var instanceY = real( string_copy( objectsStr, i + 4, 3 ) ) + 32;
    var objectIndex = real( string_copy( objectsStr, i + 7, 3 ) );
    if( objectIndex == oPlayerStart ) {
        continue;
    }
    
    var objectDestroyed = false;
    with( objectIndex ) {
        if( x == instanceX && y == instanceY && !objectDestroyed ) {
            instance_destroy();
            objectDestroyed = true;
        }
    }   
}

