if not stringIsInt(global.input_string) exit

var spd = real(global.input_string)
if spd >= 2 and spd <= 100 {
    room_speed = spd
    saveConfig()
}
