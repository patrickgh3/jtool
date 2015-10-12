if not global.input_bool exit

if window_get_fullscreen() {
    window_set_fullscreen(false)
    oWorld.alarm[0] = 1
    oWorld.alarm[2] = 2
}
else loadMapAskName()
