var filename = get_open_filename_ext('jtool record file|*.jrec','',working_directory,'Choose Record to Continue')
if filename == '' exit

continueRecord(filename)
