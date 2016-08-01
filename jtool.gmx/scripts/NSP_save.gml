///NSP_save(String)
/*
Returns ID of the DS List containing the data about the converted string.
*/
var list_1,list_2,list_3;

list_1=ds_list_create();
list_2=ds_list_create();
list_3=ds_list_create();

nsp_convert_to_list(argument0,list_1);
nsp_list_parameters(list_1,list_2);

list_3[|0]=list_1;
list_3[|1]=list_2;

ds_list_add(global.nspListSaved,list_3);

return list_3;

