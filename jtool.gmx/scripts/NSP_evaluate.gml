///NSP_evaluate(String)
/*
Evaluates a string of GML code.
*/
var nspListStr=global.nspListStr,
    nspListPar=global.nspListPar;
var rv;

if argument0="" return "";

nsp_convert_to_list(argument0,nspListStr);
nsp_list_parameters(nspListStr,nspListPar);

rv=nsp_evaluate_list(0,ds_list_size(nspListStr)-1);

//SQ:
if is_string(rv) and nsp_is_string(rv)
 rv=string_copy(rv,2,string_length(rv)-2);

ds_list_clear(nspListStr);
ds_list_clear(nspListPar);

return rv;

