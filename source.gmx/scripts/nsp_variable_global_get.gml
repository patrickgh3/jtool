///nsp_variable_global_get(Name)
/*
Underlying NSP script. Can be changed by user (read NSP Documentation for more info).
*/
var nspToken=global.nspToken;
var work_str;

work_str=argument0;

if string_copy(argument0,1,7)="global."
 work_str=string_delete(work_str,1,7);
 
switch (work_str) begin

 case "score":
   return score;
  break;
  
 case "lives":
   return lives;
  break;
  
 case "health":
   return health;
  break;
  
 case "mouse_x":
   return mouse_x;
  break;
  
 case "mouse_y":
   return mouse_y;
  break;
/*
 case "state":
   return global.state;
  break;
  */
 case "trg":
   return global.trg;
  break;
  
 default:
   NSP_notify("SCRIPT: nsp_variable_global_get. ERROR: Variable not supported ("+argument0+").");
   return nspToken[NSP_TOK.abort];
  break;
  
end;


