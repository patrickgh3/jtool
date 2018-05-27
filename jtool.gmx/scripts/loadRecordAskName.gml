var filename = get_open_filename_ext('jtool record file|*.jrec','',game_save_id,'Open Record')
if filename == '' exit

loadRecord(filename)
