// Converts an integer into a base 64 string.

var number = argument0

var base64string = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@'
var result = ''

while number > 0 {
    var decimal = number/64
    number = floor(decimal)
    var pos = (decimal-number)*64
    result = string_char_at(base64string,pos+1) + result
}

return result
