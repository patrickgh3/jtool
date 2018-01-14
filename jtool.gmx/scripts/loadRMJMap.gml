// Deletes all edit objects and loads an RMJ map from file.

filename = get_open_filename_ext('RMJ map|*.map','','','Open RMJ map')
if filename == '' exit
var f = file_text_open_read(filename)
var firstline = file_text_read_string(f)
if firstline != ' 1.030000' {
    file_text_close(f)
    inputOverlay(input_info,false,'Not a valid RMJ map.')
    exit
}
file_text_readln(f)
file_text_readln(f)
file_text_readln(f)
with( oEdit ) { clearUndoStack(); }
oEdit.undo_nochanges = true
with all if objectInPalette(object_index) instance_destroy()
with oPatBall instance_destroy()
while not file_text_eoln(f) {
    var xx = file_text_read_real(f)
    var yy = file_text_read_real(f)
    var type = file_text_read_real(f)
    instance_create(xx,yy,rmjCodeToObject(type))
    if file_text_eoln(f) break
}
file_text_close(f)

global.infinitejump = false
global.dotkid = false
global.savetype = savetype_shoot
global.bordertype = bordertype_death

global.savePlayerX = oPlayerStart.x+17
global.savePlayerY = oPlayerStart.y+23
global.savePlayerXScale = 1
room_speed = 50
oDeathDisplay.death_count = 0
loadPlayer()
completelyResetZoom()
global.lastloadedmapname = splitDelimString(filename, '\', string_count('\', filename))
updateCaption()
