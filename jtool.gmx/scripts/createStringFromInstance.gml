// Given an object, returns a string that represents it,
// in the following format: "xxxyyyooo", where
// x and y digits are its position, and o digits are its object_index.
// See also: undoDeserializeObject

var instance = argument0

if instance.x < -32 or instance.x >= 832 return ''

return getPositionString( instance.x, instance.y ) + padStringLeft(string(instance.object_index),3,'0')
