if global.input_cancel exit

var should_load = true
if global.input_bool {
    should_load = saveMap()
}

if should_load {
    if not window_get_fullscreen() {
        loadRMJMap()
    }
    else {
        window_set_fullscreen(false)
        oWorld.alarm[0] = 1
        oWorld.alarm[2] = 2
    }
}
