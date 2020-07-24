///NSP_execute_string(String)
/*

Executes a string of GML code.

Returns: Argument of "return" statement or undefined
         (see the documentation). 

*/
var nspListStr, nspListPar, rv, succ;

if (argument0 == "") return undefined;

nspListStr = ds_list_create();
nspListPar = ds_list_create();

succ = nsp_convert_to_list(argument0, nspListStr, nspListPar);

if (!succ) {

  NSP_notify("SCRIPT: NSP_execute_string. ERROR: String will not be executed because it could not be converted.");

  ds_list_destroy(nspListStr);
  ds_list_destroy(nspListPar);
  
  return undefined;
  
  }
  
rv = nsp_execute_master(0, ds_list_size(nspListStr)-1, false, nspListStr, nspListPar);

ds_list_destroy(nspListStr);
ds_list_destroy(nspListPar);

  //DEBUG:
  //show_message("NSP_execute_string returned:");
  //show_message(rv);

return rv;
