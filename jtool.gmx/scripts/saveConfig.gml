// Save the currently set options to an ini file.

var depthstring = ''
for (var i=0; i<ds_list_size(global.depthList); i++) {
    depthstring += string(ds_list_find_value(global.depthList,i))
    if i != ds_list_size(global.depthList) - 1 depthstring += ','
}

ini_open('config.ini')
ini_write_real('prefs', 'death', global.deathEnabled)
ini_write_real('prefs', 'gridsnap', oEdit.snap)
ini_write_string('prefs', 'skin', global.skinName)
ini_write_real('prefs', 'fullscreen', window_get_fullscreen())
ini_write_real('prefs', 'showanalysis', global.showanalysis)
ini_write_real('prefs', 'dotkidoutline', global.dotkidoutline)
ini_write_real('prefs', 'hidesidebar', global.hidesidebar)
ini_write_real('prefs', 'editorinstructions', global.editorinstructions)
ini_write_real('prefs', 'showhitbox', global.showhitbox)
ini_write_real('prefs', 'grid_draw', global.grid_draw)
ini_write_real('prefs', 'mousecoords', global.mousecoords)
ini_write_real('prefs', 'playery_extended', global.playery_extended)
ini_write_string('prefs', 'depthorder', depthstring)
ini_close()
