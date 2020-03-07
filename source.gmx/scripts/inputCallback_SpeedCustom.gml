if not stringIsInt(global.input_string)
or not global.input_bool exit

var spd = real(global.input_string)
if spd >= 1 and spd <= 100 {
    room_speed = spd
}
