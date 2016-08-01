///NSP_evaluate_saved(List ID)
/*
Evaluates a saved (converted) string.
*/
var nspListStr=global.nspListStr,
    nspListPar=global.nspListPar;
var rv;

ds_list_copy(nspListStr,argument0[|0]);
ds_list_copy(nspListPar,argument0[|1]);

rv=nsp_evaluate_list(0,ds_list_size(nspListStr)-1);

//SQ:
if is_string(rv) and nsp_is_string(rv)
 rv=string_copy(rv,2,string_length(rv)-2);

ds_list_clear(nspListStr);
ds_list_clear(nspListPar);

return rv;

