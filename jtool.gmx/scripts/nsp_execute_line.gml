///nsp_execute_line(Start, End)
/*
Underlying NSP script.
*/
var nspListStr=global.nspListStr,
    nspListPar=global.nspListPar;
var i,pos,pri_b,list_min,list_max;

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
 
 //See if the single code has statements:
 if (nspListPar[|list_min]=NSP_TYPE._specword) or
    (nspListStr[|list_min]="{") {
 
  nsp_execute_master(list_min,pos,true);
 
  }
  else {
  
   nsp_execute_single(list_min,pos);
   
   }
 
 list_min=pos+1;
 
end;


