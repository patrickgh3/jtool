filename = get_save_filename_ext('jtool map|*.jmap','','','Save Map')
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
    var sid
    switch object_index {
        case oEditBlock: sid=1 break
        case oEditMiniBlock: sid=2 break
        case oSpikeUp: sid=3 break
        case oSpikeRight: sid=4 break
        case oSpikeLeft: sid=5 break
        case oSpikeDown: sid=6 break
        case oMiniSpikeUp: sid=7 break
        case oMiniSpikeRight: sid=8 break
        case oMiniSpikeLeft: sid=9 break
        case oMiniSpikeDown: sid=10 break
        case oApple: sid=11 break
        case oSave: sid=12 break
        case oPlatform: sid=13 break
        case oWater: sid=14 break
        case oWater2: sid=15 break
        case oWalljumpL: sid=16 break
        case oWalljumpR: sid=17 break
        case oKillerBlock: sid=18 break
        default: continue
    }
    if x >= 4096 or y >= 4096 or x < 0 or y < 0 {
        objects_out_of_range = true
        continue
    }
    file_text_write_string(f,real_to_base32string(sid,1)) // 1 chars since sid < 32
    file_text_write_string(f,real_to_base32string(x,2))   // 2 chars since x will be < 1024
    file_text_write_string(f,real_to_base32string(y,2))   // 2 chars since y will be < 1024
}

file_text_close(f)

if objects_out_of_range {
    show_message('Some objects were out of range. (x or y < 0 or >= 4096)')
}
