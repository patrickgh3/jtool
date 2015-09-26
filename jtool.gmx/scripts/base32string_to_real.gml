// Converts a lowercase base32 string into a real (number).

var input = argument0
var base32string = '0123456789abcdefghijklmnopqrstuv'
var result = 0

var length = string_length(input)
for (var i=0; i<length; i++) {
    var value = string_pos(string_char_at(input,i+1),base32string)-1;
    result += value * power(32,length-1-i)
}

return result