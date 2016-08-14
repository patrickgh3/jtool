// Read an XML file. (more complex)

var xmlString = '
<root>
  <pets>
    <cat id="1">=^.^=</cat>
    <fish id="2">}{}</fish>
    <cat id="3">~(=^.w.^)</cat>
    <cat id="4">hi im a cat</cat>
    <fish id="5">{}{</fish>
  </pets>
</root>
'

/* output: 

cat! #1
cat looks like: =^.^=
fish! #2
fish looks like: }{}
cat! #3
cat looks like: ~(=^.w.^)
cat! #4
cat looks like: hi im a cat
fish! #5
fish looks like: {}{

*/



DerpXml_Init() // call this just once at the start of your game
DerpXmlRead_LoadString(xmlString)
var inCat = false
var inFish = false

while DerpXmlRead_Read() {

    switch DerpXmlRead_CurType() {
    
    case DerpXmlType_OpenTag:
        switch DerpXmlRead_CurValue() {
        case 'cat':
            show_debug_message('cat! #'+DerpXmlRead_CurGetAttribute('id'))
            inCat = true
            break
        case 'fish':
            show_debug_message('fish! #'+DerpXmlRead_CurGetAttribute('id'))
            inFish = true
            break
        }
        break
    
    case DerpXmlType_Text:
        if inCat {
            show_debug_message('cat looks like: '+DerpXmlRead_CurValue())
            inCat = false
        }
        if inFish {
            show_debug_message('fish looks like: '+DerpXmlRead_CurValue())
            inFish = false
        }
        break
        
    }
}
DerpXmlRead_UnloadString()
