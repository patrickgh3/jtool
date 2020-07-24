///NSP_save(String)
/*

Converts a string into a ds_list, so that it can be executed / evaluated
later and multiple times faster than usual.

Returns: ID of the ds_list containing the data about the converted string.

*/
var rv, list_1, list_2, list_3;

list_1 = ds_list_create();
list_2 = ds_list_create();
list_3 = ds_list_create();

rv = nsp_convert_to_list(argument0, list_1, list_2);

list_3[|2] = rv;
list_3[|1] = list_2;
list_3[|0] = list_1;

ds_list_add(global.nspListSaved, list_3);

return list_3;
