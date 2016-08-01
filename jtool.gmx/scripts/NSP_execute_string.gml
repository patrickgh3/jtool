///NSP_execute_string(String)
/*
Executes a string of GML code.
*/
var nspListStr=global.nspListStr,
    nspListPar=global.nspListPar;

if argument0="" exit;

nsp_convert_to_list(argument0,nspListStr);
nsp_list_parameters(nspListStr,nspListPar);

nsp_execute_master(0,ds_list_size(nspListStr)-1,false);

ds_list_clear(nspListStr);
ds_list_clear(nspListPar);

//KLAZEN: moved error check internal here, calls the callabck function with the error string and returns status
if (global._nsp_error != '') {
    codable_error_callback(global._nsp_error);
    global._nsp_error='';
    return false;
}
return true;
