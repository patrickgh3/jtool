var xx = argument0
var yy = argument1
var obj = argument2

var inst = instance_create(xx, yy, obj)
var collision = false
with inst {
    collision = collision_rectangle(
        bbox_left,bbox_top,bbox_right,bbox_bottom,object_index,true,true)
    instance_destroy()
}

if not collision {
    editCreateObject(xx, yy, obj)
}
