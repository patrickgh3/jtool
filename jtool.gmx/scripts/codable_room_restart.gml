///codable_room_restart()
//Call this on room restart
//Removes any dynamically created instances
//Resets triggers
//Resets codable objects to their initial state

//TODO: disable restart for any modal dialog, right now is just oInputOverlay (maybe that's good enough)
if not instance_exists(oInputOverlay) {
    for (var i = 0; i < ds_list_size(global.dynamic_instance_list); i++)
        with global.dynamic_instance_list[|i]
            instance_destroy()
    ds_list_clear(global.dynamic_instance_list)
    
    global.trg=0;

    with all {
        if codable_is_codable(id) and code_step_written != '' {
            new_instance = instance_create(xstart,ystart,object_index)
            new_instance.code_step_compiled = code_step_compiled
            new_instance.code_step_written = code_step_written
            instance_destroy()
        }
    }
}
