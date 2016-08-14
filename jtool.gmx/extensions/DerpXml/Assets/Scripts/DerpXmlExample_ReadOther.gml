// Use the raw value script, and handle when attributes don't exist.

DerpXml_Init() // call this just once at the start of your game
DerpXmlRead_LoadString('<a cat="bag" />')

DerpXmlRead_Read()
show_debug_message(DerpXmlRead_CurRawValue()) // prints "<a cat="bag" />"
var undefinedVal = DerpXmlRead_CurGetAttribute('catttttt')
if is_undefined(undefinedVal) {
    show_debug_message('undefined')
}

DerpXmlRead_UnloadString()
