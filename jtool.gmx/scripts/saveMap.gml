// Saves all the present palette objects to file.

filename = get_save_filename_ext('jtool map|*.jmap','','','Save Map')
if filename == '' exit

oEdit.undo_nochanges = true

// header and info
var f = FS_file_text_open_write(filename)
var delim = '|'
FS_file_text_write_string(f,'jtool')
FS_file_text_write_string(f,delim)
FS_file_text_write_string(f,global.version_string)
FS_file_text_write_string(f,delim)
FS_file_text_write_string(f,'inf:'+string(global.infinitejump))
FS_file_text_write_string(f,delim)
FS_file_text_write_string(f,'dot:'+string(global.dotkid))
FS_file_text_write_string(f,delim)
FS_file_text_write_string(f,'px:'+floatToBase32String(global.savePlayerX))
FS_file_text_write_string(f,delim)
FS_file_text_write_string(f,'py:'+floatToBase32String(global.savePlayerY))
FS_file_text_write_string(f,delim)
FS_file_text_write_string(f,'ps:'+string(global.savePlayerXScale))
FS_file_text_write_string(f,delim)
FS_file_text_write_string(f,'objects:')

// objects
var objects_out_of_range = false
var objects_unrecognized = false
with all {
    if not objectInPalette(object_index) continue
    saved = false
}
with all {
    if not objectInPalette(object_index) continue
    if saved continue
    var maxpos = 896
    var minpos = -128
    if x >= maxpos or y >= maxpos or x < minpos or y < minpos {
        objects_out_of_range = true
        continue
    }
    
    var yy = y
    FS_file_text_write_string(f,'-'+padStringLeft(intToBase32String(y+128),2,'0'))
    with all {
        if not objectInPalette(object_index) or y != yy or saved continue
        var saveid = objectToSaveID(object_index)
        if saveid != -1 {
            FS_file_text_write_string(f,intToBase32String(saveid)
                +padStringLeft(intToBase32String(x+128),2,'0'))
            saved = true
        }
        else {
            objects_unrecognized = true
        }
    }
}
FS_file_text_close(f)

// warning messages for oob or unrecognized objects
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
