/// DerpXmlWrite_Text(text)
//
//  Writes text for the middle of an element.

var text = argument0;

with objDerpXmlWrite {
    writeString += text
    lastWriteType = DerpXmlType_Text
    lastWriteEmptyElement = false
}
