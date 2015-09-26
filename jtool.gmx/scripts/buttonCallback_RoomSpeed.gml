var s = get_integer('Room speed, frames per second, between 2 and 100:',room_speed)
if s >= 2 and s <= 100 {
    room_speed = s
    saveConfig()
}