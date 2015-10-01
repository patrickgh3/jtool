var s = get_integer('room speed yo',room_speed)
if s >= 2 and s <= 100 {
    room_speed = s
    saveConfig()
}
