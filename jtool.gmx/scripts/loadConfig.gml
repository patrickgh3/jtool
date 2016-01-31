// Load the currently set options from a previously saved ini file.

var filename = prefix_project_path_if_needed('config.ini')
FS_ini_open(filename)
global.deathEnabled = FS_ini_read_real('prefs','death',false)
oEdit.snap = FS_ini_read_real('prefs','gridsnap',32)
global.skinName = FS_ini_read_string('prefs','skin','pat_default')
window_set_fullscreen(FS_ini_read_real('prefs','fullscreen',false))
oWorld.alarm[0]=1
global.showanalysis = FS_ini_read_real('prefs','showanalysis',true)
global.dotkidoutline = FS_ini_read_real('prefs','dotkidoutline',true)
global.hidesidebar = FS_ini_read_real('prefs','hidesidebar',false)
global.editorinstructions = FS_ini_read_real('prefs','editorinstructions',true)
global.showhitbox = FS_ini_read_real('prefs','showhitbox',0)
global.grid_draw = FS_ini_read_real('prefs','grid_draw',false)
global.mousecoords = FS_ini_read_real('prefs','mousecoords',false)
global.playery_extended = FS_ini_read_real('prefs','playery_extended',false)
var depthstring = FS_ini_read_string('prefs','depthorder','0,1,2,3')
global.waterlocked = FS_ini_read_real('prefs', 'waterlocked', false)
FS_ini_close()

if string_count(',',depthstring) != 3 depthstring = '0,1,2,3'
ds_list_clear(global.depthList)
for (var i=0; i<4; i++) {
    ds_list_add(global.depthList, real(splitDelimString(depthstring, ',', i)))
}
updatePaletteDepths()

loadSkin(global.skinName)
