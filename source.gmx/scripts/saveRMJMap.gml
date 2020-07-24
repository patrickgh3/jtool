// Saves all the present RMJ-compatible objects to an RMJ map file.

filename = get_save_filename_ext('RMJ map|*.map','','','Save RMJ Map')
if filename == '' exit

// header
var f = file_text_open_write(filename)
file_text_write_string(f,' 1.030000')
file_text_writeln(f)
file_text_write_string(f,'Imported from jtool '+global.version_string)
file_text_writeln(f)
file_text_write_string(f,'someone')
file_text_writeln(f)

// objects
var non_rmj_object = false
with all {
    var rmjcode = objectToRmjCode(object_index)
    if rmjcode == -1 {
        if objectInPalette(object_index) non_rmj_object = true
        continue
    }
    file_text_write_string(f,' '+string(x)+' '+string(y)+' '+string(rmjcode)) 
}
file_text_close(f)

if non_rmj_object {
    inputOverlay(input_info,false,"Warning: Some objects aren't supported by RMJ and weren't saved.")
}

global.lastloadedmapname = splitDelimString(filename, '\', string_count('\', filename))
updateCaption()
