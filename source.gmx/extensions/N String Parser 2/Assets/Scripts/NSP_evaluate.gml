///NSP_evaluate(String)
/*

Evaluates a string of GML code.

Returns: Result of evaluation or the abort string.

*/
var nspListStr, nspListPar,
    nspToken = global.nspToken;
var rv, succ;

if (argument0 == "") return "";

nspListStr = ds_list_create();
nspListPar = ds_list_create();

succ = nsp_convert_to_list(argument0, nspListStr, nspListPar);

if (!succ) {

  NSP_notify("SCRIPT: NSP_evaluate. ERROR: String will not be evaluated because it could not be converted.");

  ds_list_destroy(nspListStr);
  ds_list_destroy(nspListPar);
  
  return nspToken[NSP_TOK.abort];
  
  }

rv = nsp_evaluate_list(0, ds_list_size(nspListStr)-1, nspListStr, nspListPar);

//SQ:
if is_string(rv) and nsp_is_string(rv)
 rv=string_copy(rv,2,string_length(rv)-2);

ds_list_destroy(nspListStr);
ds_list_destroy(nspListPar);

return rv;
