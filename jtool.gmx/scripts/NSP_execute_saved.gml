///NSP_execute_saved(List ID)
/*
Executes a saved (converted) string.
*/
var nspListStr=global.nspListStr,
    nspListPar=global.nspListPar;

ds_list_copy(nspListStr,argument0[|0]);
ds_list_copy(nspListPar,argument0[|1]);

nsp_execute_master(0,ds_list_size(nspListStr)-1,false);

ds_list_clear(nspListStr);
ds_list_clear(nspListPar);

