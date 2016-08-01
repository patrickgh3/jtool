///codable_step()
//This must be placed in the step event of any codable objects.
//Executes the code assigned to this instance, if there is any
//Disables failing code to prevent an endless loop of errors
//Resets object to initial state when you restart the room

if not instance_exists(oInputOverlay) {
    if keyboard_check_pressed(ord('R')) {
        new_instance = instance_create(xstart,ystart,object_index)
        new_instance.code_step_compiled = code_step_compiled
        new_instance.code_step_written = code_step_written
        instance_destroy()
    }
    else {
        if code_step_compiled {
            NSP_execute_saved(code_step_compiled)
            if global._nsp_error {
                NSP_free_saved(code_step_compiled)
                code_step_compiled = 0
                global._nsp_error=false;
            }
        }
    }
}
