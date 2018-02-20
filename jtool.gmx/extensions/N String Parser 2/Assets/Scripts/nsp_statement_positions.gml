///nsp_statement_positions(Start, End, Statement, StrList)
/*
Underlying NSP script.
*/
var nspListStr = argument3,
    nspToken = global.nspToken;
var a,i,pos_1,pos_2,pos_3,list_min,list_max;

//Set up:
list_min=argument0;
list_max=argument1;

//Searching:
   pos_1=-1;
   for (i=list_min; i<=list_max; i+=1) begin
    if nspListStr[|i]="(" {
     pos_1=i;
     break;
     }
     
    if i=list_max {
     NSP_notify("SCRIPT: nsp_statement_positions. ERROR: (1) Syntax error ("+argument2+" statement).",nspListStr,list_min,list_max);
     return nspToken[NSP_TOK.abort];
     }
   end;
    
   pri_b=0;
   pos_2=-1;
   for (i=pos_1+1; i<=list_max; i+=1) begin
    if nspListStr[|i]="("
     pri_b+=1
     else if nspListStr[|i]=")" {
      if pri_b=0 {
       pos_2=i;
       break;
       }
       else pri_b-=1;
      }
      
    if i=list_max {
     NSP_notify("SCRIPT: nsp_statement_positions. ERROR: (2) Syntax error ("+argument2+" statement).",nspListStr,list_min,list_max);
     return nspToken[NSP_TOK.abort];
     }
   end;
   
   pri_b=0;
   pos_3=-1;
   for (i=pos_2+1; i<=list_max; i+=1) begin
   
    if nspListStr[|i]="{"
     pri_b+=1;
     else if nspListStr[|i]="}"
      pri_b-=1;

    if (nspListStr[|i]=";" or i=list_max) and pri_b=0 {
     pos_3=i;
     
     break;
     }
        
    if i=list_max and pos_3=-1 {
     NSP_notify("SCRIPT: nsp_statement_positions. ERROR: (3) Syntax error ("+argument2+" statement).",nspListStr,list_min,list_max);
     return nspToken[NSP_TOK.abort];
     }  
   end;
   
//Returning:
a[0]=pos_1;
a[1]=pos_2;
a[2]=pos_3;

return a;
