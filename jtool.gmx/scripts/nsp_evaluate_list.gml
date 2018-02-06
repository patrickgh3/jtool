///nsp_evaluate_list(Start, End, StrList, ParList)
/*
Underlying NSP script.
*/
var nspListStr = argument2,
    nspListPar = argument3,
    nspToken=global.nspToken;
var list_min,list_max;

list_min=argument0;
list_max=argument1;

//1. If it's single, then evaluate single:
if (list_min=list_max)
 return nsp_evaluate_single(nspListStr[|list_min],nspListPar[|list_min]);

//2. If it's not single, then it's an expression or a script:
var grid,rv;
grid=nsp_build_grid(list_min, list_max, nspListStr, nspListPar);
rv=nsp_evaluate_long(grid, false);

return rv;
