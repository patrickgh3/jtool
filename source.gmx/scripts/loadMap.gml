// Deletes all palette objects and loads a map from file.

var filename = argument0

var f = file_text_open_read(filename)
var content = file_text_read_string(f)
file_text_close(f)

var index = 1
var currentstring = ''
var section_number = 0
var delim = '|'
var versionstring = ''
var mapver_major = 0

global.infinitejump = false
global.dotkid = false
global.savetype = savetype_shoot
global.bordertype = bordertype_death
global.saveGrav = 1

while index <= string_length(content) {
    var nextchar = string_char_at(content,index);
    if nextchar != delim {
         currentstring += nextchar
    }
    if nextchar == delim or index == string_length(content) {
        // jtool
        if section_number == 0 and currentstring != 'jtool'{
            inputOverlay(input_info,false,'Not a valid jtool map.')
            exit
        }
        // version
        else if section_number == 1 {
            var mapver_major = real(splitDelimString(currentstring,'.',0))
            if mapver_major > global.version_major {
                inputOverlay(input_info,false,'Warning: may not be compatible with map;#it has a new major version.')
            }
        }
        // everything else
        else if section_number > 1 {
            var prefix = splitDelimString(currentstring,':',0)
            var suffix = splitDelimString(currentstring,':',1)
            if prefix == 'objects' {
                with( oEdit ) { clearUndoStack(); }
                oEdit.undo_nochanges = true
                with all if objectInPalette(object_index) instance_destroy()
                with oPatBall instance_destroy()
                var objectstring = suffix
                var i = 1
                var yy = 0
                while i <= string_length(objectstring) {
                    if string_copy(objectstring,i,1) == '-' {
                        yy = base32StringToInt(string_copy(objectstring,i+1,2))
                        i += 3
                    }
                    else {
                        var objectid = saveIDToObject(base32StringToInt(string_copy(objectstring,i,1)))
                        if objectid != noone {
                            var xx = base32StringToInt(string_copy(objectstring,i+1,2))
                            var inst = instance_create(xx-128,yy-128,objectid);
                        }
                        i += 3
                    }
                }
            }
            else if prefix == 'dot' {
                global.dotkid = real(suffix)
            }
            else if prefix == 'inf' {
                global.infjump = real(suffix)
            }
            else if prefix == 'sav' {
                global.savetype = real(suffix)
            }
            else if prefix == 'bor' {
                global.bordertype = real(suffix)
            }
            else if prefix == 'px' {
                global.savePlayerX = base32StringToFloat(suffix)
            }
            else if prefix == 'py' {
                global.savePlayerY = base32StringToFloat(suffix)
            }
            else if prefix == 'ps' {
                global.savePlayerXScale = real(suffix)
            }
            else if prefix == 'pg' {
                global.saveGrav = real(suffix)
            }
        }
        section_number += 1
        currentstring = ''
    }
    index += 1
}
room_speed = 50
oDeathDisplay.death_count = 0
loadPlayer()
completelyResetZoom()
if global.shouldresetloadedmapname {
    global.shouldresetloadedmapname = false
    global.lastloadedmapname = ''
    updateCaption()
}
else {
    global.lastloadedmapname = splitDelimString(filename, '\', string_count('\', filename))
    updateCaption()
}
