var skinsfolder = prefix_project_path_if_needed('skins/')
var filename = skinsfolder+'skins.ini'

if not FS_directory_exists(skinsfolder) {
    FS_directory_create(skinsfolder)
}

FS_ini_open(filename)
var str = FS_ini_read_string('skins','names','')
FS_ini_close()

if str == '' {
    FS_ini_open(filename)
    FS_ini_write_string('skins','names','skin1,skin2,skin3,skin4')
    FS_ini_close()
    inputOverlay(input_info,false,'skins/skins.ini has no skin folder names.#Please add some!')
    exit
}

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
