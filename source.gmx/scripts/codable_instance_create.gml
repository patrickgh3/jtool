///codable_instance_create(x,y,obj)
//creates an instance, and tags it as being created dynamically
//for instance, we want to destroy all dynamic objects on restart

var inst = instance_create(argument0,argument1,argument2);
ds_list_add(global.dynamic_instance_list,inst)

//force all dynamic instances to be at a lower depth, to prevent covering normal instances
inst.depth=100;

//every 32 instances, check for dynamic instances outside the room and delete them
global.dynamic_instance_counter++
if global.dynamic_instance_counter mod 32 == 0 {
    for (var i=0; i<ds_list_size(global.dynamic_instance_list); i++) {
        with global.dynamic_instance_list[|i] {
            if x < -160
            or y < -160
            or x > room_width + 160
            or y > room_height + 160 {
                instance_destroy() 
                i-=1 //if we remove an element, keep the index at the current position
            }
        }
    }
}

return inst

