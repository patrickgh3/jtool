filename = get_open_filename_ext('RMJ map|*.map','','','Open RMJ map')
if filename == '' exit
var f = file_text_open_read(filename)
var firstline = file_text_read_string(f)
if firstline != ' 1.030000' {
    show_message('Invalid RMJ map.')
    file_text_close(f)
    exit
}
file_text_readln(f)
file_text_readln(f)
file_text_readln(f)
oEdit.undo_objectstring = ''
with all if object_is_edit(object_index) instance_destroy()
while not file_text_eoln(f) {
    var xx = file_text_read_real(f)
    var yy = file_text_read_real(f)
    var type = file_text_read_real(f)
    if type == 3 continue // player start (TODO)
    instance_create(xx,yy,rmjobject_to_object(type))
    if file_text_eoln(f) break
}

file_text_close(f)
