///nsp_execute_line(Start, End, StrList, ParList)
/*
Underlying NSP script.
*/
var nspListStr = argument2,
    nspListPar = argument3;
var i,pos,pri_b,list_min,list_max,rv;

list_min=argument0;
list_max=argument1;

while (list_min<list_max) begin

 //Find the position of the first semicolon:  
 pos=-1;
 pri_b=0;
 for (i=list_min; i<=list_max; i+=1) begin
            
  if nspListStr[|i]="{"
   pri_b+=1;
   else if nspListStr[|i]="}"
    pri_b-=1;
      
  if (nspListStr[|i]=";" and pri_b=0) {
   pos=i;
   break;
   }
 
 end;
 
 if pos=-1 {
  pos=list_max;
  }
 
 if nspListStr[|list_min]=";" {
  list_min+=1;
  continue;
  }
  
 //See if the single code has statements:
 if (nspListPar[|list_min] = NSP_TYPE._specword) or
    (nspListStr[|list_min] = "{") {
 
  rv=nsp_execute_master(list_min,pos, true, nspListStr, nspListPar);
  if !is_undefined(rv) return rv;
 
  }
  else {
  
   nsp_execute_single(list_min, pos, nspListStr, nspListPar);
   
   }
 
 list_min=pos+1;
 
end;

return undefined;

