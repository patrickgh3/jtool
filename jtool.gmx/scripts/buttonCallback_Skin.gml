ini_open('skins/skins.ini')
var str = ini_read_string('skins','names','')
ini_close()

var numskins = string_count(',',str)+1
var nextSkinIndex = 0
for (var i=0; i<numskins; i++) {
    var name = string_split(str,i,',')
    if name == global.skinName {
        nextSkinIndex = (i+1) mod numskins
    }
}

global.skinName = string_split(str,nextSkinIndex,',')
loadSkin(global.skinName)
saveConfig()
