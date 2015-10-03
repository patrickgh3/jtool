// Returns a color made from a string formatted like "hue,sat,val".

// color_from_hsvstring(str,delim)

var str = argument0
var delim = argument1

return make_color_hsv(
real(string_split(str,0,delim)),
real(string_split(str,1,delim)),
real(string_split(str,2,delim)))
