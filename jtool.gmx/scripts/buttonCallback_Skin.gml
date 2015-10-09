var filename = prefix_project_path_if_needed('skins/skins.ini')
FS_ini_open(filename)
var str = FS_ini_read_string('skins','names','')
FS_ini_close()

var numskins = string_count(',',str)+1
var nextSkinIndex = 0
for (var i=0; i<numskins; i++) {
    var name = splitDelimString(str,',',i)
    if name == global.skinName {
        nextSkinIndex = (i+1) mod numskins
    }
}

global.skinName = splitDelimString(str,',',nextSkinIndex)
loadSkin(global.skinName)
saveConfig()
