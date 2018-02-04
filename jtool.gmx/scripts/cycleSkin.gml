var skinCycleDir = argument0

var skinsfolder = prefix_project_path_if_needed('skins/')
var filename = skinsfolder+'skins.ini'

if not directory_exists(skinsfolder) {
    directory_create(skinsfolder)
}

ini_open(filename)
var str = ini_read_string('skins','names','')
ini_close()

if str == '' {
    ini_open(filename)
    ini_write_string('skins','names','skin1,skin2,skin3,skin4')
    ini_close()
    inputOverlay(input_info,false,'skins/skins.ini has no skin folder names.#Please add some!')
    exit
}

var numskins = string_count(',',str)+1
var nextSkinIndex = 0
for (var i=0; i<numskins; i++) {
    var name = splitDelimString(str,',',i)
    if name == global.skinName {
        var n = i+skinCycleDir
        if n < 0 n = numskins-1
        if n >= numskins n = 0
        nextSkinIndex = n
    }
}

global.skinName = splitDelimString(str,',',nextSkinIndex)
loadSkin(global.skinName)
saveConfig()
