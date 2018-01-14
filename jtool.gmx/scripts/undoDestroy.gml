var objectsStr = argument0;

for( var i = 0; i < string_length( objectsStr ); i += 9 ) {
    var instanceX = real( string_copy( objectsStr, i + 1, 3 ) ) + 32;
    var instanceY = real( string_copy( objectsStr, i + 4, 3 ) ) + 32;
    var objectIndex = real( string_copy( objectsStr, i + 7, 3 ) );
    
    instance_create( instanceX, instanceY, objectIndex );   
}

