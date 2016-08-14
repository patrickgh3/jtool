// Read a string containing XML.

/* Outputs:
OpenTag, a
Text, derp
CloseTag, a
*/

DerpXml_Init() // call this just once at the start of your game
DerpXmlRead_LoadString('<a>derp</a>')
while DerpXmlRead_Read() {
    show_debug_message(DerpXmlRead_CurType()+', '+DerpXmlRead_CurValue())
}
DerpXmlRead_UnloadString()





// Read an XML file.

/* Outputs:
OpenTag, a
Text, derp
CloseTag, a
*/

var f = file_text_open_write('test.xml')
file_text_write_string(f, '<a>derp</a>')
file_text_close(f)

//DerpXml_Init() // call this just once at the start of your game
DerpXmlRead_OpenFile('test.xml')
while DerpXmlRead_Read() {
    show_debug_message(DerpXmlRead_CurType()+', '+DerpXmlRead_CurValue())
}
DerpXmlRead_CloseFile()
