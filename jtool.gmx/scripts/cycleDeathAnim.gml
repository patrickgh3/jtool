var deathsCycleDir = argument0

var deathsfolder = prefix_project_path_if_needed('deaths/')
var filename = deathsfolder+'deaths.ini'

if not directory_exists(deathsfolder) {
    directory_create(deathsfolder)
}

ini_open(filename)
var str = ini_read_string('deaths','names','')
ini_close()

if str == '' {
    inputOverlay(input_info,false,'deaths/deaths.ini has no death animation folder names.#Please add some!')
    exit
}

var numskins = string_count(',',str)+1
var nextDeathIndex = 0
for (var i=0; i<numskins; i++) {
    var name = splitDelimString(str,',',i)
    if name == global.deathAnimName {
        var n = i+deathsCycleDir
        if n < 0 n = numskins-1
        if n >= numskins n = 0
        nextDeathIndex = n
    }
}

global.deathAnimName = splitDelimString(str,',',nextDeathIndex)
loadDeathAnim(global.deathAnimName)
saveConfig()
