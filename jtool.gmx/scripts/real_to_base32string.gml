// Converts a real (number) into a base 32 string.

var number = argument0
var minlength = argument1
var base32string = '0123456789abcdefghijklmnopqrstuv'
var result = ''

while number > 0 {
    var decimal = number/32
    number = floor(decimal)
    var pos = (decimal-number)*32
    result = string_char_at(base32string,pos+1) + result
}

while string_length(result) < minlength {
    result = '0' + result
}

return result