// Saves all the present edit objects to file.

window_set_fullscreen(false)
filename = get_save_filename_ext('jtool map|*.jmap','','','Save Map')
if filename == '' exit
var f = file_text_open_write(filename)

var delim = '|'
var version = '1.0.1'

file_text_write_string(f,'jtool')
file_text_write_string(f,delim)
file_text_write_string(f,version)
file_text_write_string(f,delim)
file_text_write_string(f,'objects:')

var objects_out_of_range = false

with all {
    if not object_is_edit(object_index) continue
    var maxpos = 896
    var minpos = -128
    if x >= maxpos or y >= maxpos or x < minpos or y < minpos {
        objects_out_of_range = true
        continue
    }
    file_text_write_string(f,edit_object_serialize(self))
}

file_text_close(f)

if objects_out_of_range {
    show_message('Some objects were out of range. (x or y < '+string(minpos)+' or >= '+string(maxpos)+')')
}
