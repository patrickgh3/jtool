// Converts a base 64 string to an integer.

var str = argument0

var base64string = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@'
var result = 0
var length = string_length(str)

for (var i=0; i<length; i++) {
    var char = string_char_at(str,i+1)
    var charvalue = string_pos(char,base64string)-1
    var placevalue = power(64,length-1-i);
    result += charvalue * placevalue
}

return result
