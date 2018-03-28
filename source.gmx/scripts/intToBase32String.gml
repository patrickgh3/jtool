// Converts an integer into a base 32 string.

var number = argument0

var base32string = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@'
var result = ''

while number > 0 {
    var decimal = number/32
    number = floor(decimal)
    var pos = (decimal-number)*32
    result = string_char_at(base32string,pos+1) + result
}

return result
