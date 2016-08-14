// Write an XML file.

/* Target output:

<root>
  <a>derp</a>
  <b>derp</b>
  <c/>
  <d cat="bag"></d>
  <e cat="bag" cat2="bag2"/>
</root>

*/

DerpXml_Init() // call this just once at the start of your game
DerpXmlWrite_New()
//DerpXmlWrite_Config('    ', chr(10)) // Optional: configure tab and newline

DerpXmlWrite_OpenTag('root')
    DerpXmlWrite_OpenTag('a')
    DerpXmlWrite_Text('derp')
    DerpXmlWrite_CloseTag()
    
    DerpXmlWrite_LeafElement('b', 'derp')
    
    DerpXmlWrite_LeafElement('c', '')
    
    DerpXmlWrite_OpenTag('d')
    DerpXmlWrite_Attribute('cat', 'bag')
    DerpXmlWrite_CloseTag()
    
    DerpXmlWrite_LeafElement('e', '')
    DerpXmlWrite_Attribute('cat', 'bag')
    DerpXmlWrite_Attribute('cat2', 'bag2')
DerpXmlWrite_CloseTag()

var xmlString = DerpXmlWrite_GetString()
DerpXmlWrite_UnloadString() // free DerpXml's internal copy of the xml string

show_debug_message(xmlString)
var f = file_text_open_write('test.xml')
file_text_write_string(f, xmlString)
file_text_close(f)
