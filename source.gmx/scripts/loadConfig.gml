// Load the currently set options from a previously saved ini file.

var filename = prefix_project_path_if_needed('config.ini')
ini_open(filename)
global.deathEnabled = FSIniReadReal('prefs','death',false)
oEdit.snap = FSIniReadReal('prefs','gridsnap',32)
global.skinName = ini_read_string('prefs','skin','pat_default')
global.deathAnimName = ini_read_string('prefs','deathanim','default')
window_set_fullscreen(FSIniReadReal('prefs','fullscreen',false))
oWorld.alarm[0]=1
global.showanalysis = FSIniReadReal('prefs','showanalysis',true)
global.dotkidoutline = FSIniReadReal('prefs','dotkidoutline',true)
global.hidesidebar = FSIniReadReal('prefs','hidesidebar',false)
global.editorinstructions = FSIniReadReal('prefs','editorinstructions',true)
global.showhitbox = FSIniReadReal('prefs','showhitbox',0)
global.grid_draw = FSIniReadReal('prefs','grid_draw',false)
global.mousecoords = FSIniReadReal('prefs','mousecoords',false)
global.playery_extended = FSIniReadReal('prefs','playery_extended',false)
var depthstring = ini_read_string('prefs','depthorder','0,1,2,3')
global.backup = FSIniReadReal('prefs','backup',true)
global.checkupdates = FSIniReadReal('prefs','checkupdates',true)
ini_close()

if string_count(',',depthstring) != 3 depthstring = '0,1,2,3'
ds_list_clear(global.depthList)
for (var i=0; i<4; i++) {
    ds_list_add(global.depthList, real(splitDelimString(depthstring, ',', i)))
}
updatePaletteDepths()

loadSkin(global.skinName)
