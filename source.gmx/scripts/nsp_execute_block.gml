///nsp_execute_block(Start, End)
/*
Underlying NSP script.
*/
var nspListStr=global.nspListStr;
var i,list_min,list_max,pri_b,pos;

list_min=argument0;
list_max=argument1;

while (list_min<list_max) begin

 //Find the position of the first semicolon of the highest priority:
 pos=0;
 pri_b=0;
 for (i=list_min; i<=list_max; i+=1) begin
            
  if nspListStr[|i]="{"
   pri_b+=1;
   else if nspListStr[|i]="}"
    pri_b-=1;
      
  if pri_b=0 and (nspListStr[|i]=";" or i=list_max) {
   pos=i;
   break;
   }
 
 end;

 //Pass to master again: 
 nsp_execute_master(list_min,pos,true);
 list_min=i+1;
 
end;


