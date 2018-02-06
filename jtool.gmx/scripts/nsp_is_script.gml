///nsp_is_script(String)
/*
Underlying NSP script.
*/
var nspToken=global.nspToken;
var a,i,work_str,pri_q,pri_b;

a=string_pos("(",argument0);

if a<=1 or nsp_gm_nom(string_copy(argument0,1,a-1))=false
 return false;

//Find closed bracket:
work_str=argument0;
pri_b=0;
pri_q=1;
for (i=a; i<=string_length(work_str); i+=1) begin
     
 if string_copy(work_str,i,1)=nspToken[NSP_TOK.quote]
  pri_q*=-1;
       
 if pri_q=1 {
 if string_copy(work_str,i,1)="("
  pri_b+=1;
  else if string_copy(work_str,i,1)=")"
   pri_b-=1;
   }
      
 if pri_q=1 and pri_b=0 and string_copy(work_str,i,1)=")" {
 /*BREAK*/
  if i=string_length(work_str) {
   return true;
   break;
   }
   else {
    return false;
    break;
    }
  }
 
end;
