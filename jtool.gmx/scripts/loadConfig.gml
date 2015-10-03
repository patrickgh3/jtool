// Load the currently set options from a previously saved ini file.

ini_open('config.ini')
global.deathEnabled = ini_read_real('prefs','death',false)
room_speed = ini_read_real('prefs','speed',50)
oEdit.snap = ini_read_real('prefs','gridsnap',32)
global.skinName = ini_read_string('prefs','skin','pat_default')
window_set_fullscreen(ini_read_real('prefs','fullscreen',false))
oWorld.alarm[0]=1
global.showanalysis = ini_read_real('prefs','showanalysis',true)
global.dotkidoutline = ini_read_real('prefs','dotkidoutline',true)
global.hidesidebar = ini_read_real('prefs','hidesidebar',false)
global.editorinstructions = ini_read_real('prefs','editorinstructions',true)
global.showhitbox = ini_read_real('prefs','showhitbox',0)
global.showgrid = ini_read_real('prefs','showgrid',false)
ini_close()

loadSkin(global.skinName)
