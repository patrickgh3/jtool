///nsp_list_remove(Start, End, StrList, ParList)
/*
Underlying NSP script.
*/
var nspListStr = argument2,
    nspListPar = argument3;
var s,e;

s = argument0;
e = argument1;

repeat (e+1-s) {
 ds_list_delete(nspListStr, s);
 ds_list_delete(nspListPar, s);
 }
