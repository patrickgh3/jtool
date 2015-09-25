// Deletes all edit objects and loads a map from file.

filename = get_open_filename_ext('jtool map|*.jmap','','','Open Map')
var f = file_text_open_read(filename)
var content = file_text_read_string(f)
file_text_close(f)

var index = 1
var currentstring = ''
var section_number = 0
var delim = '|'
var versionstring = ''
var version1 = 0
var version2 = 0
var version3 = 0

while index <= string_length(content) {
    var nextchar = string_char_at(content,index);
    if nextchar != delim {
         currentstring += nextchar
    }
    if nextchar == delim or index == string_length(content) {
        // jtool
        if section_number == 0 and currentstring != 'jtool'{
            show_message('Not a jtool file.')
            exit
        }
        // version
        else if section_number == 1 {
            versionstring = currentstring
            version1 = string_split(versionstring,0,'.')
            version2 = string_split(versionstring,1,'.')
            version3 = string_split(versionstring,2,'.')
        }
        // everything else
        else if section_number > 1 {
            if string_split(currentstring,0,':') == 'objects' {
                // parse objects aaaaa
                with all {
                    if object_is_edit(object_index) instance_destroy()
                }
                var objectstring = string_split(currentstring,1,':')
                var i = 1
                while i < string_length(objectstring) {
                    var s = string_copy(objectstring,i,5)
                    var sid = base32string_to_real(string_copy(s,1,1))
                    var xx = base32string_to_real(string_copy(s,2,2))
                    var yy = base32string_to_real(string_copy(s,4,2))
                    var obj
                    switch sid {
                        case 1:  obj=oEditBlock break
                        case 2:  obj=oEditMiniBlock break
                        case 3:  obj=oSpikeUp break
                        case 4:  obj=oSpikeRight break
                        case 5:  obj=oSpikeLeft break
                        case 6:  obj=oSpikeDown break
                        case 7:  obj=oMiniSpikeUp break
                        case 8:  obj=oMiniSpikeRight break
                        case 9:  obj=oMiniSpikeLeft break
                        case 10: obj=oMiniSpikeDown break
                        case 11: obj=oApple break
                        case 12: obj=oSave break
                        case 13: obj=oPlatform break
                        case 14: obj=oWater break
                        case 15: obj=oWater2 break
                        case 16: obj=oWalljumpL break
                        case 17: obj=oWalljumpR break
                        case 18: obj=oKillerBlock break
                        default: continue
                    }
                    instance_create(xx,yy,obj)
                    i += 5
                }
            }
        }
        show_debug_message(currentstring)
        section_number += 1
        currentstring = ''
    }
    index += 1
}
