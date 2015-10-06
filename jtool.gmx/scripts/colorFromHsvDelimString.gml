// Returns a color made from a string formatted like "hue,sat,val".

// color_from_hsvstring(str,delim)

var str = argument0
var delim = argument1

return make_color_hsv(
real(splitDelimString(str,delim,0)),
real(splitDelimString(str,delim,1)),
real(splitDelimString(str,delim,2)))
