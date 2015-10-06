// Saves all the present edit objects to file.

filename = get_save_filename_ext('jtool map|*.jmap','','','Save Map')
if filename == '' exit

oEdit.undo_nochanges = true
var f = file_text_open_write(filename)

var delim = '|'
var version = '1.0.1'

file_text_write_string(f,'jtool')
file_text_write_string(f,delim)
file_text_write_string(f,version)
file_text_write_string(f,delim)
file_text_write_string(f,'inf:'+string(global.infinitejump))
file_text_write_string(f,delim)
file_text_write_string(f,'dot:'+string(global.dotkid))
file_text_write_string(f,delim)
file_text_write_string(f,'objects:')

var objects_out_of_range = false
var objects_unrecognized = false

with all {
    if not objectInPalette(object_index) continue
    var maxpos = 896
    var minpos = -128
    if x >= maxpos or y >= maxpos or x < minpos or y < minpos {
        objects_out_of_range = true
        continue
    }
    var str = mapSerializeObject(self)
    if str != '' {
        file_text_write_string(f,str)
    }
    else {
        objects_unrecognized = true
    }
}

file_text_close(f)

var warning_message = ''
if objects_unrecognized {
    warning_message += "Warning: Some objects were not official and weren't saved."
}
if objects_out_of_range {
    warning_message = "Warning: Some objects were out of range and weren't saved."
        +'#(x or y < '+string(minpos)+' or >= '+string(maxpos)+')'
}
if warning_message != '' {
    inputOverlay(input_info,false,warning_message)
}
