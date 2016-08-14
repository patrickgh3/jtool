/// DerpXmlWrite_Attribute(key, value)
//
//  Adds an attribute to the open tag that was just written.
//  Call this right after DerpXmlWrite_OpenTag, or DerpXmlWrite_LeafElement with no text.
//
//  <newTag>    -->    <newTag key="value">

var key = argument0
var value = argument1

with objDerpXmlWrite {
    // verify the last added thing was an open tag or empty element
    if lastWriteType != DerpXmlType_OpenTag and not lastWriteEmptyElement {
        DerpXml_ThrowError("Attributes was added directly after something that wasn't an open tag, empty element, or another attribute!");
    }

    // find appropriate place to insert. one character back if an empty element.
    var insertPos = string_length(writeString)
    if lastWriteEmptyElement {
        insertPos -= 1 + string_length(newlineString)
    }
    
    var insertString = ' ' + string(key) + '="' + string(value) + '"'
    writeString = string_insert(insertString, writeString, insertPos)
}
