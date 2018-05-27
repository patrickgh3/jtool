// Converts a base 32 string to an integer.

var str = argument0

var base32string = '0123456789abcdefghijklmnopqrstuv'
var result = 0
var length = string_length(str)

for (var i=0; i<length; i++) {
    var char = string_char_at(str,i+1)
    var charvalue = string_pos(char,base32string)-1
    var placevalue = power(32,length-1-i);
    result += charvalue * placevalue
}

return result
