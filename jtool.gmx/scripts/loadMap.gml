// Deletes all palette objects and loads a map from file.

var filename = argument0

var f = FS_file_text_open_read(filename)
var content = FS_file_text_read_string(f)
FS_file_text_close(f)

var index = 1
var currentstring = ''
var section_number = 0
var delim = '|'
var versionstring = ''
var version1 = 0
var version2 = 0
var version3 = 0

global.infinitejump = false
global.dotkid = false

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
            versionstring = currentstring
            version1 = splitDelimString(versionstring,'.',0)
            version2 = splitDelimString(versionstring,'.',1)
            version3 = splitDelimString(versionstring,'.',2)
        }
        // everything else
        else if section_number > 1 {
            var prefix = splitDelimString(currentstring,':',0)
            var suffix = splitDelimString(currentstring,':',1)
            if prefix == 'objects' {
                oEdit.undo_objectstring = ''
                oEdit.undo_nochanges = true
                with all if objectInPalette(object_index) instance_destroy()
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
                        var xx = base32StringToInt(string_copy(objectstring,i+1,2))
                        var inst = instance_create(xx-128,yy-128,objectid);
                        inst.undo_recent = false;
                        i += 3
                    }
                }
                /*global.savePlayerX = oPlayerStart.x+17
                global.savePlayerY = oPlayerStart.y+23
                global.savePlayerXScale = 1
                loadPlayer()*/
            }
            else if prefix == 'dot' {
                global.dotkid = real(suffix)
            }
            else if prefix == 'inf' {
                global.infjump = real(suffix)
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
        }
        section_number += 1
        currentstring = ''
    }
    index += 1
}
loadPlayer()
completelyResetZoom()
