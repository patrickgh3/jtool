// Load the currently set options from a previously saved ini file.

ini_open('config.ini')
global.deathEnabled = ini_read_real('prefs','death',false)
room_speed = ini_read_real('prefs','speed',50)
oEdit.snap = ini_read_real('prefs','gridsnap',16)
global.skinName = ini_read_string('prefs','skin','pat_default')
ini_close()

loadSkin(global.skinName)
