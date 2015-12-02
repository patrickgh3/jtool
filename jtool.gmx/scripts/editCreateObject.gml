var xx = argument0
var yy = argument1
var obj = argument2

var i = instance_create(xx, yy, obj);
i.undo_recent = true

if selected_object == oPlayerStart {
    with oPlayerStart if not (x == xx and y == yy) instance_destroy()
    global.savePlayerX = xx+17
    global.savePlayerY = yy+23
    global.savePlayerXScale = 1
    loadPlayer()
}

