var filename = argument0

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
FS_file_text_write_string(f,'sav:'+string(global.savetype))
FS_file_text_write_string(f,delim)
FS_file_text_write_string(f,'bor:'+string(global.bordertype))
FS_file_text_write_string(f,delim)
FS_file_text_write_string(f,'px:'+floatToBase32String(global.savePlayerX))
FS_file_text_write_string(f,delim)
FS_file_text_write_string(f,'py:'+floatToBase32String(global.savePlayerY))
FS_file_text_write_string(f,delim)
FS_file_text_write_string(f,'ps:'+string(global.savePlayerXScale))
FS_file_text_write_string(f,delim)
FS_file_text_write_string(f,'pg:'+string(global.saveGrav))
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
        if x >= maxpos or y >= maxpos or x < minpos or y < minpos {
            objects_out_of_range = true
            continue
        }
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

// secondary data
FS_file_text_writeln(f)
FS_file_text_writeln(f)
FS_file_text_write_string(f,'data repeated below for easy parsing by other tools')
FS_file_text_writeln(f)
FS_file_text_write_string(f,'objects: (x, y, type)')
FS_file_text_writeln(f)
with all {
    if not objectInPalette(object_index) continue
    var maxpos = 896
    var minpos = -128
    if x >= maxpos or y >= maxpos or x < minpos or y < minpos {
        objects_out_of_range = true
        continue
    }
    FS_file_text_write_string(f,string(x)+' '+string(y)+' '+string(objectToSaveID(object_index))+' ')
}
FS_file_text_writeln(f)
FS_file_text_write_string(f, 'version:'+global.version_string)
FS_file_text_writeln(f)
FS_file_text_write_string(f, 'infinitejump:'+string(global.infinitejump))
FS_file_text_writeln(f)
FS_file_text_write_string(f, 'dotkid:'+string(global.dotkid))
FS_file_text_writeln(f)
FS_file_text_write_string(f, 'savetype:'+string(global.savetype))
FS_file_text_writeln(f)
FS_file_text_write_string(f, 'bordertype:'+string(global.bordertype))
FS_file_text_writeln(f)
FS_file_text_write_string(f, 'playersavex:'+string(global.savePlayerX))
FS_file_text_writeln(f)
FS_file_text_write_string(f, 'playersavey:'+string_format(global.savePlayerY,3,16))
FS_file_text_writeln(f)
FS_file_text_write_string(f, 'playersavexscale:'+string(global.savePlayerXScale))
FS_file_text_writeln(f)

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

return true
