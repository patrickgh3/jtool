var xx = argument0
var yy = argument1
var obj = argument2

var i = instance_create(xx, yy, obj);
i.sprite_index = selected_sprite
i.mask_index = i.sprite_index
i.undo_recent = true

image_speed = global.objectToStringMap[? object_index]

if selected_object == oPlayerStart {
    with oPlayerStart if not (x == xx and y == yy) instance_destroy()
    global.savePlayerX = xx+17
    global.savePlayerY = yy+23
    global.savePlayerXScale = 1
    loadPlayer()
}

