// Save the currently set options to an ini file.

ini_open('config.ini')
ini_write_real('prefs','death',global.deathEnabled)
ini_write_real('prefs','speed',room_speed)
ini_write_real('prefs','gridsnap',oEdit.snap)
ini_write_string('prefs','skin',global.skinName)
ini_close()
