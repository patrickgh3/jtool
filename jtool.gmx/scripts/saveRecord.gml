// Saves the record.

filename = get_save_filename_ext('jtool record file|*.jrec','',game_save_id,'Save Record')
if filename == '' return false

var success = saveRecordName(filename)
return success
