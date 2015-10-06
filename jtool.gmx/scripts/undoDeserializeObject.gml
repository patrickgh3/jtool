// Creates an object from an undo serialized string.
// See also: undoSerializeObject

var str = argument0

instance_create(real(string_copy(str,1,3))+32
               ,real(string_copy(str,4,3))+32
               ,real(string_copy(str,7,3)))
