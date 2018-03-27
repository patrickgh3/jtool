// Save the currently set options to an ini file.

var depthstring = ''
for (var i=0; i<ds_list_size(global.depthList); i++) {
    depthstring += string(ds_list_find_value(global.depthList,i))
    if i != ds_list_size(global.depthList) - 1 depthstring += ','
}

var filename = prefix_project_path_if_needed('config.ini')
FS_ini_open(filename)
FS_ini_write_real('prefs','death',global.deathEnabled)
FS_ini_write_real('prefs','gridsnap',oEdit.snap)
FS_ini_write_string('prefs','skin',global.skinName)
FS_ini_write_real('prefs','fullscreen',window_get_fullscreen())
FS_ini_write_real('prefs','showanalysis',global.showanalysis)
FS_ini_write_real('prefs','dotkidoutline',global.dotkidoutline)
FS_ini_write_real('prefs','hidesidebar',global.hidesidebar)
FS_ini_write_real('prefs','editorinstructions',global.editorinstructions)
FS_ini_write_real('prefs','showhitbox',global.showhitbox)
FS_ini_write_real('prefs','grid_draw',global.grid_draw)
FS_ini_write_real('prefs','mousecoords',global.mousecoords)
FS_ini_write_real('prefs','playery_extended',global.playery_extended)
FS_ini_write_string('prefs','depthorder',depthstring)
FS_ini_write_real('prefs','backup',global.backup)
FS_ini_write_real('prefs','checkupdates',global.checkupdates)
FS_ini_close()
