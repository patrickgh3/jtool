var filename = argument0
if not global.BackupFailSafe{
oEdit.undo_nochanges = true}
global.BackupFailSafe = false
// header and info
var f = file_text_open_write(filename)
var delim = '|'
file_text_write_string(f,'jtool')
file_text_write_string(f,delim)
file_text_write_string(f,global.version_string)
file_text_write_string(f,delim)
file_text_write_string(f,'inf:'+string(global.infinitejump))
file_text_write_string(f,delim)
file_text_write_string(f,'dot:'+string(global.dotkid))
file_text_write_string(f,delim)
file_text_write_string(f,'sav:'+string(global.savetype))
file_text_write_string(f,delim)
file_text_write_string(f,'bor:'+string(global.bordertype))
file_text_write_string(f,delim)
file_text_write_string(f,'px:'+floatToBase32String(global.savePlayerX))
file_text_write_string(f,delim)
file_text_write_string(f,'py:'+floatToBase32String(global.savePlayerY))
file_text_write_string(f,delim)
file_text_write_string(f,'ps:'+string(global.savePlayerXScale))
file_text_write_string(f,delim)
file_text_write_string(f,'pg:'+string(global.saveGrav))
file_text_write_string(f,delim)
file_text_write_string(f,'objects:')

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
    file_text_write_string(f,'-'+padStringLeft(intToBase32String(y+128),2,'0'))
    with all {
        if not objectInPalette(object_index) or y != yy or saved continue
        if x >= maxpos or y >= maxpos or x < minpos or y < minpos {
            objects_out_of_range = true
            continue
        }
        var saveid = objectToSaveID(object_index)
        if saveid != -1 {
            file_text_write_string(f,intToBase32String(saveid)
                +padStringLeft(intToBase32String(x+128),2,'0'))
            saved = true
        }
        else {
            objects_unrecognized = true
        }
    }
}

// secondary data
file_text_writeln(f)
file_text_writeln(f)
file_text_write_string(f,'data repeated below for easy parsing by other tools')
file_text_writeln(f)
file_text_write_string(f,'objects: (x, y, type)')
file_text_writeln(f)
with all {
    if not objectInPalette(object_index) continue
    var maxpos = 896
    var minpos = -128
    if x >= maxpos or y >= maxpos or x < minpos or y < minpos {
        objects_out_of_range = true
        continue
    }
    file_text_write_string(f,string(x)+' '+string(y)+' '+string(objectToSaveID(object_index))+' ')
}
file_text_writeln(f)
file_text_write_string(f, 'version:'+global.version_string)
file_text_writeln(f)
file_text_write_string(f, 'infinitejump:'+string(global.infinitejump))
file_text_writeln(f)
file_text_write_string(f, 'dotkid:'+string(global.dotkid))
file_text_writeln(f)
file_text_write_string(f, 'savetype:'+string(global.savetype))
file_text_writeln(f)
file_text_write_string(f, 'bordertype:'+string(global.bordertype))
file_text_writeln(f)
file_text_write_string(f, 'playersavex:'+string(global.savePlayerX))
file_text_writeln(f)
file_text_write_string(f, 'playersavey:'+string_format(global.savePlayerY,3,16))
file_text_writeln(f)
file_text_write_string(f, 'playersavexscale:'+string(global.savePlayerXScale))
file_text_writeln(f)

file_text_close(f)

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
