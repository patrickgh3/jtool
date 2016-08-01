///codable_error_callback(err_msg_str)
//Called from NSP_execute_string and NSP_execute_saved if an error occured during execution.
//You can handle the error message here however you like

//show_message(argument0);
inputOverlay(input_info,0,"#Code Execution Error in "+object_get_name(object_index)+":##"+argument0);
