///NSP_free_saved(List ID)
/*

Frees the memory used by a saved (converted) string.

Returns: n/a 

*/
var index;

ds_list_destroy(argument0[|0]);
ds_list_destroy(argument0[|1]);
ds_list_destroy(argument0);

index=ds_list_find_index(global.nspListSaved,argument0);
ds_list_delete(global.nspListSaved,index);
