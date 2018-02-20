///NSP_evaluate_saved(List ID)
/*

Evaluates a saved (converted) string.

Returns: Result of evaluation or the abort string.

*/
var nspListStr = ds_list_create(),
    nspListPar = ds_list_create();
    nspToken   = global.nspToken;
var rv;

if (argument0[|2] == 0) {

  ds_list_destroy(nspListStr);
  ds_list_destroy(nspListPar);

  NSP_notify("SCRIPT: NSP_evaluate_saved. ERROR: Input did not pass validation.");
  return nspToken[NSP_TOK.abort];

  }

ds_list_copy(nspListStr, argument0[|0]);
ds_list_copy(nspListPar, argument0[|1]);

rv = nsp_evaluate_list(0, ds_list_size(nspListStr)-1, nspListStr, nspListPar);

//SQ:
if (is_string(rv) and nsp_is_string(rv))
 rv = string_copy(rv, 2, string_length(rv)-2);

ds_list_destroy(nspListStr);
ds_list_destroy(nspListPar);

return rv;
