var isActivated = argument0;
var isDragged = argument1;

x = -1000
y = -1000

if( isDragged ) {
    cursor_sprite = sCursorClosedHand;
} else {
    cursor_sprite = sCursorOpenHand;
}
window_set_cursor(cr_none)

if( isActivated ) {
    draggedInstance = findInstanceToDrag( mouse_x,mouse_y );
    if( draggedInstance != noone ) {
        dragStartX = draggedInstance.x;
        dragStartY = draggedInstance.y;
    }
}

if( !isDragged ) {
    if( draggedInstance != noone && draggedInstance.object_index != oPlayer ) {
        var undoEventStr = 'm' + getPositionString( dragStartX, dragStartY ) + createStringFromInstance( draggedInstance )
        addUndoEvent( undoEventStr );
    }
    draggedInstance = noone;
}

if( draggedInstance != noone ) {
   var freeX = mouse_x + ( snap - sprite_get_width( draggedInstance.sprite_index ) ) / 2;
   var freeY = mouse_y + ( snap - sprite_get_height( draggedInstance.sprite_index ) ) / 2;
   draggedInstance.x = floor( freeX / snap ) * snap;
   draggedInstance.y = floor( freeY / snap ) * snap;
}
