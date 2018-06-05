var filename, f ;
filename = argument0

f = file_text_open_write(filename)

file_text_write_string(f,ds_list_write(global.recordList));
file_text_writeln(f)

file_text_write_string(f,string(global.recordX))
file_text_writeln(f)

file_text_write_string(f,string(global.recordY))
file_text_writeln(f)

file_text_write_string(f,string(global.recordGrav))
file_text_writeln(f)

file_text_write_string(f,string(global.recordXscale))
file_text_writeln(f)

file_text_write_string(f,string(global.recordVspeed))
file_text_writeln(f)

//Variables to continue a saved record
if global.stopX != -1 {
file_text_write_string(f,string(global.stopX))
file_text_writeln(f)

file_text_write_string(f,string(global.stopY))
file_text_writeln(f)

file_text_write_string(f,string(global.stopgrav))
file_text_writeln(f)

file_text_write_string(f,string(global.stopplayer_xscale)) 
file_text_writeln(f)

file_text_write_string(f,string(global.stopVspeed)) 
}

else{ 
file_text_write_string(f,string(global.pausedX))
file_text_writeln(f)

file_text_write_string(f,string(global.pausedY))
file_text_writeln(f)

file_text_write_string(f,string(global.pausedgrav))
file_text_writeln(f)

file_text_write_string(f,string(global.pausedplayer_xscale)) 
file_text_writeln(f)

file_text_write_string(f,string(global.pausedVspeed)) 
}



file_text_close(f);

global.stopX = -1
global.stopY = 0
global.stopgrav = 0
global.stopplayer_xscale = 0
global.stopVspeed = 0


