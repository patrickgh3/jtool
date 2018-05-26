if not stringIsInt(global.input_string) 
or not global.input_bool exit

var decimal = real(global.input_string)
if decimal >= 0 and decimal == floor(decimal)
and instance_exists(oPlayer) {
    oPlayer.y = floor(oPlayer.y) + decimal/power(10,string_length(global.input_string))
}
