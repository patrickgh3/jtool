if window_get_fullscreen() {
    window_set_fullscreen(false)
    oWorld.alarm[0] = 1
    oWorld.alarm[4] = 2
}
else saveRMJMap()
