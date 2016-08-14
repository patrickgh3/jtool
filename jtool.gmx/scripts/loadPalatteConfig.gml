/// loadPalatteConfig()
// loads the palatte objects from the config file.

if not file_exists('palatte_config.xml') {
    file_copy('palatte_config_default.xml', 'palatte_config.xml')
}

// clear previous palatte list
for (var i=0; i<ds_list_size(global.palatteList); i+=1) {
    ds_map_destroy(global.paletteList[| i])
}

// parse file string to populate palatte list
var palInstMap = -1
var lastValue = ''
var lastType = ''
DerpXmlRead_OpenFile('palatte_config.xml')
while DerpXmlRead_Read() {
    var type = DerpXmlRead_CurType()
    var value = DerpXmlRead_CurValue()
    if type == DerpXmlType_OpenTag {
        if value == 'palitem' {
            palInstMap = ds_map_create()
            ds_list_insert(global.palatteList, ds_list_size(global.palatteList), palInstMap)
        }
    }
    else if type == DerpXmlType_CloseTag {
        if (value == 'obj' or value == 'spr' or value == 'maskcustom' or value == 'mask'
        or value == 'tooltip') {
            var text = ''
            if lastType == DerpXmlType_Text {
                text = lastValue
            }
            palInstMap[? value] = text
        }
    }
    lastValue = value
    lastType = type
}
DerpXmlRead_CloseFile()
