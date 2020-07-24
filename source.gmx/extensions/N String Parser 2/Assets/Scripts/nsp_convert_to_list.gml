///nsp_convert_to_list(String, Token List, Types List)
/*
Underlying NSP script.
Returns: 1 = Success, 0 = Failure
*/
var work_str, token, types, succ;

//Setup:
work_str = argument0;
token = argument1;
types = argument2;

if (work_str == "") {

  NSP_notify("SCRIPT: nsp_convert_to_list. ERROR: Empty string provided.");
  return 0;

  }

//Work:
succ = nsp_tokenize(nsp_string_crop(work_str), token);

if (!succ) {

  NSP_notify("SCRIPT: nsp_convert_to_list. ERROR: Tokenization failed.");
  return 0;

  }

succ = nsp_list_set_types(token, types);

if (!succ) {

  NSP_notify("SCRIPT: nsp_convert_to_list. ERROR: Types could not be determined.");
  return 0;

  }

succ = nsp_list_tidy_and_verify(token, types);

if (!succ) {

  NSP_notify("SCRIPT: nsp_convert_to_list. ERROR: Verification not passed.");
  return 0;

  }

/*show_debug_message("List is now (3rd pass):" + "#");
for (i=0; i<ds_list_size(token); i+=1)
    show_debug_message(token[|i] + "#");*/

return 1;
    
    
    
    
    
    
