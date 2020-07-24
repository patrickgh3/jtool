///nsp_list_to_string(List, Start, End, Separator);
/*
Underlying NSP script.
*/
//var nspListStr=global.nspListStr;
var i,s;

s="";
for (i=argument1; i<=argument2; i+=1) begin

 s+=argument0[|i]+argument3;

end;

return s;
