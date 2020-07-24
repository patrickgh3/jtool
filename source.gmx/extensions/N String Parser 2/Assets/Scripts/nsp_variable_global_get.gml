///nsp_variable_global_get(Name)
/*
Underlying NSP script..
*/
var nspToken=global.nspToken;
var work_str;

work_str=argument0;

if string_copy(argument0,1,7)="global."
 work_str=string_delete(work_str,1,7);
 
switch (work_str) begin

 case "room_speed":
   return room_speed;
  break;
  
 case "state":
   return global.state;
  break;
  
  // Add more here...
  
 default:
   NSP_notify("SCRIPT: nsp_variable_global_get. ERROR: Variable not supported ("+argument0+").");
   return nspToken[NSP_TOK.abort];
  break;
  
end;

