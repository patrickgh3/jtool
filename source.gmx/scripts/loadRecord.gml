var filename, f; 
filename = argument0
f = file_text_open_read(filename)

ds_list_read(global.recordList,file_text_read_string(f))
file_text_readln(f)

global.recordX=real(file_text_read_string(f))
file_text_readln(f)

global.recordY=real(file_text_read_string(f))
file_text_readln(f)

global.recordGrav=real(file_text_read_string(f))
file_text_readln(f)

global.recordXscale=real(file_text_read_string(f));
file_text_readln(f)

global.recordVspeed=real(file_text_read_string(f));



file_text_close(f);

playRecord()

