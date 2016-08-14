/// DerpXmlWrite_Config(indentString, newlineString)
//
//  Configures options for writing.
//
//  indentString     String used for indents, default is "  ". Set to "" to disable indents.
//  newlineString    String used for newlines, default is chr(10). Set to "" to disable newlines.

var indentString = argument0
var newlineString = argument1

with objDerpXmlWrite {
    self.indentString = indentString
    self.newlineString = newlineString
}
