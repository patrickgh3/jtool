/// DerpXmlRead_CurGetAttribute(keyString)
//
//  Returns the value for the given key in the current node's attributes.
//  Example: in <a cat="bag>     DXR_CGA('cat') returns 'bag'
//
//  If the attribute doesn't exist, calling is_undefined() on the return value will return true.
//  See the example scripts, DerpXmlExample_ReadOther for usage.

var keyString = argument0

return objDerpXmlRead.attributeMap[? keyString]
