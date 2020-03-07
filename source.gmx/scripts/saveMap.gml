// Saves all the present palette objects to file.

filename = get_save_filename_ext('jtool map|*.jmap','','','Save Map')
if filename == '' return false

var success = saveMapName(filename)
if success {
    global.lastloadedmapname = splitDelimString(filename, '\', string_count('\', filename))
    updateCaption()
    deleteBackup()
}
return success
