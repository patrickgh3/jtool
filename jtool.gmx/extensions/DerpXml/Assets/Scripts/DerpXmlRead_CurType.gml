/// DerpXmlRead_CurType()
//
//  Returns the type of the current node, as a DerpXmlType macro.
//
//  DerpXMLType_OpenTag     - Opening tag <tag>
//  DerpXMLType_CloseTag    - Closing tag </tag>
//  DerpXMLType_Text        - Text inside an element <a>TEXT</a>
//  DerpXMLType_Whitespace  - Whitespace between elements "    "
//  DerpXMLType_StartOfFile - Start of document, no reads performed yet
//  DerpXMLType_EndOfFile   - End of document

return objDerpXmlRead.currentType
