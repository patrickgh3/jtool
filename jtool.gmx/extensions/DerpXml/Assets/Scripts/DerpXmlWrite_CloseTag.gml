/// DerpXmlWrite_CloseTag()
//
//  Writes a close tag, e.g. </tagname>. DerpXml remembers the name that matches it.

with objDerpXmlWrite {
    if lastWriteType == DerpXmlType_CloseTag {
        currentIndent -= 1
        repeat currentIndent {
            writeString += indentString
        }
    }
    
    var value;
    if ds_stack_size(tagNameStack) > 0 {
        value = ds_stack_pop(tagNameStack)
    }
    else {
        DerpXml_ThrowError("There was no opening tag to this closing tag!")
    }
    writeString += '</'+value+'>'
    writeString += newlineString
    lastWriteType = DerpXmlType_CloseTag
    lastWriteEmptyElement = false
}
