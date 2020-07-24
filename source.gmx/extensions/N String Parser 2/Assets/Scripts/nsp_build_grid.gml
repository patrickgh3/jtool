///nsp_build_grid(Start, End, StrList, ParList)
/*
Underlying NSP script.
*/
var nspListStr = argument2,
    nspListPar = argument3;
var i,d,list_min,list_max,grid;

list_min=argument0;
list_max=argument1;

d=(list_max-list_min);

grid=ds_grid_create(d+1,2);

for (i=0; i<=d; i+=1) begin

 grid[#i,0]=nspListStr[|list_min+i];
 grid[#i,1]=nspListPar[|list_min+i];

end;

return grid;
