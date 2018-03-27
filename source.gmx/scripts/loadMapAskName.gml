var filename = get_open_filename_ext('jtool map|*.jmap','','','Open Map')
if filename == '' exit

loadMap(filename)
