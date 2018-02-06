///nsp_string_find_last(String, Substring)
/*
Return the position of the last match of argument1 in argument0 (0 if not found).
*/
var i,t,work_str;

work_str=argument0;

if string_pos(argument1,work_str)=0 return 0;

for (i=1; i<=string_length(work_str); i+=1) begin
 t=string_length(work_str)-i+1;
 
 if string_copy(work_str,t,string_length(argument1))=argument1 {
  break;
  }

end;
 
return t;

