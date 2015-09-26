// Load the currently set options from a previously saved ini file.

ini_open('config.ini')
global.deathEnabled = ini_read_real('prefs','death',false)
room_speed = ini_read_real('prefs','speed',50)
oEdit.snap = ini_read_real('prefs','gridsnap',16)
global.skinName = ini_read_string('prefs','skin','pat_default')
window_set_fullscreen(ini_read_real('prefs','fullscreen',false))
oWorld.alarm[0]=1
global.showanalysis = ini_read_real('prefs','showanalysis',true)
ini_close()

loadSkin(global.skinName)
