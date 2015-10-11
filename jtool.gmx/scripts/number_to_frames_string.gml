var num = argument0

var str = string(num);
if string_length(str) == 1 str += '  '
str += ' frame'
if num != 1 str += 's'
return str
