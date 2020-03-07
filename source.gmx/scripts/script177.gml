var filename, file;
filename = get_save_filename_ext('test string file|*.txt',"","",'Save String')
file = file_text_open_write(filename)
file_text_write_string(file, "This is a test string");
file_text_close(file);
