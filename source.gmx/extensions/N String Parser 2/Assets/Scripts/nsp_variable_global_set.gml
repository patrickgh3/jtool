///nsp_variable_global_set(Name, Value)
/*
Underlying NSP script.
*/
var work_str;

work_str=argument0;

if is_string(argument1) {
 if nsp_is_string(argument1)
  argument1=string_copy(argument1,2,string_length(argument1)-2);
 }
 
if string_copy(argument0,1,7)="global."
 work_str=string_delete(work_str,1,7);
 
switch (work_str) begin

 case "room_speed":
   room_speed = argument1;
  break;
  
 case "state":
   global.state = argument1;
  break;
  
  // Add more here...
  
 default:
   NSP_notify("SCRIPT: nsp_variable_global_set. ERROR: Variable not supported ("+argument0+").");
  break;
  
end;


