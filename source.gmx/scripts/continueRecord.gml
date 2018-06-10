global.paused = false

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

global.recordVspeed=real(file_text_read_string(f))
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

if instance_exists(oPlayer) {
oPlayer.x = global.continueX
oPlayer.y = global.continueY
global.grav = global.continueGrav
global.player_xscale = global.continueXscale
oPlayer.vspeed = global.continueVspeed }
else { 
instance_create(global.continueX,global.continueY,oPlayer) 
global.grav = global.continueGrav
global.player_xscale = global.continueXscale
oPlayer.vspeed = global.continueVspeed }
screen_save_part("Screenie.png",0,0,display_get_width(),display_get_height())
continueRecordBegin()
