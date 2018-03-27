var xx = argument0
var yy = argument1
var obj = argument2

var i = instance_create(xx, yy, obj);
i.prevPlayerStartX = -1;
i.prevPlayerStartY = -1;

if selected_object == oPlayerStart {
    with( oPlayerStart ) {
        if( !(x == xx && y == yy) ) {
            i.prevPlayerStartX = x;
            i.prevPlayerStartY = y;
            instance_destroy();
        }
    }
    
    global.savePlayerX = xx+17
    global.savePlayerY = yy+23
    global.savePlayerXScale = 1
    loadPlayer()
} else {
    expandUndoEvent( createStringFromInstance( i ) );
}

