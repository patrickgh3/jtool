// Returns whether or not a string is composed solely of the characters 0-9
// (or has a - as the first character and at least another number afterward).

// stringIsInt(str)

var str = argument0
var validchars = '0123456789'

for (var i=0; i<string_length(str); i++) {
    var char = string_char_at(str,i+1)
    if i == 0 and char == '-' and string_length(str) >= 2 {
        continue
    }
    var found = false
    for (var j=0; j<string_length(validchars); j++) {
        if char == string_char_at(validchars,j+1) {
            found = true
            break
        }
    }
    if not found {
        return false
    }
}
return true
