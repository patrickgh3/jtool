// Load the currently set options from a previously saved ini file.

ini_open('config.ini')
global.deathEnabled = ini_read_real('prefs', 'death', false)
oEdit.snap = ini_read_real('prefs', 'gridsnap', 32)
global.skinName = ini_read_string('prefs', 'skin', 'pat_default')
window_set_fullscreen(ini_read_real('prefs', 'fullscreen', false))
oWorld.alarm[0]=1
global.showanalysis = ini_read_real('prefs', 'showanalysis', true)
global.dotkidoutline = ini_read_real('prefs', 'dotkidoutline', true)
global.hidesidebar = ini_read_real('prefs', 'hidesidebar', false)
global.editorinstructions = ini_read_real('prefs', 'editorinstructions', true)
global.showhitbox = ini_read_real('prefs', 'showhitbox', 0)
global.grid_draw = ini_read_real('prefs', 'grid_draw', false)
global.mousecoords = ini_read_real('prefs', 'mousecoords', false)
global.playery_extended = ini_read_real('prefs', 'playery_extended', false)
var depthstring = ini_read_string('prefs', 'depthorder', '0,1,2,3')
ini_close()

if string_count(',',depthstring) != 3 depthstring = '0,1,2,3'
ds_list_clear(global.depthList)
for (var i=0; i<4; i++) {
    ds_list_add(global.depthList, real(splitDelimString(depthstring, ',', i)))
}
updatePaletteDepths()

loadSkin(global.skinName)
