///codable_step()
//This must be placed in the step event of any codable objects.
//Executes the code assigned to this instance, if there is any
//Disables failing code to prevent an endless loop of errors
//Pauses execution when there's a modal dialog covering the screen

if not instance_exists(oInputOverlay) {
    if code_step_compiled {
        if not NSP_execute_saved(code_step_compiled) {
            NSP_free_saved(code_step_compiled)
            code_step_compiled = 0
        }
    }
}
