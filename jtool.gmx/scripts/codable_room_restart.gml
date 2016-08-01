///codable_room_restart()
//Call this on room restart
//Removes any dynamically created instances

for (var i = 0; i < ds_list_size(global.dynamic_instance_list); i++)
    with (global.dynamic_instance_list[|i]) instance_destroy();
    
ds_list_clear(global.dynamic_instance_list);
