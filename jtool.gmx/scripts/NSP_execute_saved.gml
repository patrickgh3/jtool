///NSP_execute_saved(List ID)
/*

Executes a saved (converted) string.

Returns: Argument of "return" statement or undefined
         (see the documentation). 

*/
var nspListStr = ds_list_create(),
    nspListPar = ds_list_create(),
    rv;

if (argument0[|2] == 0) {

  ds_list_destroy(nspListStr);
  ds_list_destroy(nspListPar);
  
  NSP_notify("SCRIPT: NSP_execute_saved. ERROR: Input did not pass validation.");
  return undefined;

  }
    
ds_list_copy(nspListStr, argument0[|0]);
ds_list_copy(nspListPar, argument0[|1]);

rv = nsp_execute_master(0, ds_list_size(nspListStr)-1, false, nspListStr, nspListPar);

ds_list_destroy(nspListStr);
ds_list_destroy(nspListPar);

return rv;
