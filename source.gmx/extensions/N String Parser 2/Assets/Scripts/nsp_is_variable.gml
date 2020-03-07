///nsp_is_variable(String)
/*
Underlying NSP script.
Returns: 0 - not a variable, 1 - simple local, 2 - complex local, 3 - global.
*/
var nspToken=global.nspToken;
var i,work_str,temp_str,pri_q,pri_d;

work_str=argument0;

if nsp_gm_nom(argument0)=true
 return 1;

//Look for a dot:
pri_q=1;
pri_b=0;
dot_pos=0;
for (i=1; i<=string_length(work_str); i+=1) begin

 if string_copy(work_str,i,1)=nspToken[NSP_TOK.quote]
    pri_q*=-1;
 
   if pri_q=1 {
    if string_copy(work_str,i,1)="("
     pri_b+=1;
     else if string_copy(work_str,i,1)=")"
      pri_b-=1;
    }
    
  if string_copy(work_str,i,1)="." {
   dot_pos=i;
   break;
   }

end;

//Error checking:
if dot_pos=0 {
 //nsp_notify("SCRIPT: nsp_is_variable. ERROR: No dot found and nomenclature mismatch ("+argument0+").");
 //return nspToken[NSP_TOK.abort];
 return 0;
 }

if nsp_gm_nom(string_delete(work_str,1,dot_pos))=false
 return 0;

temp_str=string_delete(work_str,dot_pos,string_length(work_str));
 
if temp_str="global"
 return 3;
 
if nsp_gm_nom(temp_str)
or nsp_is_asset(temp_str)
or nsp_is_number(temp_str)
or nsp_is_script(temp_str)
 return 2;

//Default:
return 0;

