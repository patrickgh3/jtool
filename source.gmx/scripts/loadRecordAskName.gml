var filename = get_open_filename_ext('jtool record file|*.jrec','',working_directory,'Open Record')
if filename == '' exit

loadRecord(filename)
