/// addObjectStringPairing(obj, str)
/// Store pairing of object and string in the two ds_maps.

var obj = argument0
var str = argument1

global.objectToStringMap[? obj] = str
global.stringToObjectMap[? str] = obj
