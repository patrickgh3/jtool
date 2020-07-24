///nsp_variable_set(Instance, Variable, Value)
/*
Underlying NSP script. Can be changed by user (read NSP Documentation for more info).
*/
if !instance_exists(argument0) {
 NSP_notify("SCRIPT: nsp_variable_set. ERROR: Trying to reference non-existing instance.");
 exit;
 }

if is_string(argument2) {
 if nsp_is_string(argument2)
  argument2=string_copy(argument2,2,string_length(argument2)-2);
 }

switch (argument1) begin

 case "x":
   (argument0).x = argument2;
  break;
 
 case "y":
   (argument0).y = argument2;
  break;
  
  // Add more here...
 
 default:
   NSP_notify("SCRIPT: nsp_variable_set. ERROR: Variable not supported ("+argument1+").");
   exit;
  break;

end;

