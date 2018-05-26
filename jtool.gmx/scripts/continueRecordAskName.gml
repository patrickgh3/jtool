var filename = get_open_filename_ext('jtool record file|*.jrec','',game_save_id,'Choose Record to Continue')
if filename == '' exit

continueRecord(filename)
