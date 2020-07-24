///nsp_variable_get(Instance, Variable)
/*
Underlying NSP script. Can be changed by user (read NSP Documentation for more info).
*/
var nspToken=global.nspToken;
    
if !instance_exists(argument0) {
 NSP_notify("SCRIPT: nsp_variable_get. ERROR: Trying to reference non-existing instance.");
 return nspToken[NSP_TOK.abort];
 }

switch (argument1) begin

 case "x":
   return (argument0).x;
  break;
 
 case "y":
   return (argument0).y;
  break;
  
  // Add more here...
 
 default:
   NSP_notify("SCRIPT: nsp_variable_get. ERROR: Variable not supported ("+argument1+").");
   return nspToken[NSP_TOK.abort];
  break;

end;

