var filename = argument0

var f = file_text_open_read(filename)

file_text_open_read(filename)

ds_list_read(global.recordList,file_text_read_string(f))
file_text_readln(f)

global.recordX=real(file_text_read_string(f))
file_text_readln(f)

global.recordY=real(file_text_read_string(f))
file_text_readln(f)

global.recordGrav=real(file_text_read_string(f))
file_text_readln(f)

global.recordXscale=real(file_text_read_string(f))
file_text_readln(f)

global.continueX=real(file_text_read_string(f))
file_text_readln(f)

global.continueY=real(file_text_read_string(f))
file_text_readln(f)

global.continueGrav=real(file_text_read_string(f))
file_text_readln(f)

global.continueXscale=real(file_text_read_string(f))
file_text_readln(f)

global.continueVspeed=real(file_text_read_string(f))

file_text_close(f)

oPlayer.x = global.continueX
oPlayer.y = global.continueY
global.grav = global.continueGrav
global.player_xscale = global.continueXscale
oPlayer.vspeed = global.continueVspeed


continueRecordBegin()

