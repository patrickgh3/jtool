var filename = get_save_filename_ext('jtool map|*.jmap','','','Save Map As')
if filename == '' return false

global.lastMapNameOkayToQuickSave = true

saveMap(filename)
