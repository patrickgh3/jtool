/// DerpXml_CauseError(message)
//
//  Causes a runtime error with a certain message.
//  This script is used internally in DerpXml; you shouldn't call it yourself.

var message = argument0

message = 'DerpXml Error: ' + message
show_debug_message(message)
var a = 0;
a += 'DerpXml Error. See the console output for details.'
