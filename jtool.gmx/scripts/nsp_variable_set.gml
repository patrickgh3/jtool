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

 case "id":
  (argument0).id=argument2;
 break; 

 case "x":
   (argument0).x=argument2;
  break;
 
 case "y":
   (argument0).y=argument2;
  break;
  
 case "a":
   (argument0).a=argument2;
  break;
  
 case "b":
   (argument0).b=argument2;
  break;
  
 case "c":
   (argument0).c=argument2;
  break;
  
 case "d":
   (argument0).d=argument2;
  break;
  
 case "i":
   (argument0).i=argument2;
  break;
  
 case "t":
   (argument0).t=argument2;
  break;
  
 case "z":
   (argument0).z=argument2;
  break;
  
 case "counter":
   (argument0).counter=argument2;
  break;
  
 case "hspeed":
   (argument0).hspeed=argument2;
  break;
 
 case "vspeed":
   (argument0).vspeed=argument2;
  break;
 
 case "speed":
   (argument0).speed=argument2;
  break;
 
 case "direction":
   (argument0).direction=argument2;
  break;
  
 case "image_angle":
   (argument0).image_angle=argument2;
  break;
 
 case "image_index":
   (argument0).image_index=argument2;
  break;
 
 case "image_speed":
   (argument0).image_speed=argument2;
  break;
 
 case "sprite_index":
   (argument0).sprite_index=argument2;
  break;
 
 //case "object_index":
 // break;
 
 case "_hspeed":
   (argument0)._hspeed=argument2;
  break;
 
 case "_vspeed":
   (argument0)._vspeed=argument2;
  break;
 
 case "_health":
   (argument0)._health=argument2;
  break;
 
 default:
   NSP_notify("SCRIPT: nsp_variable_set. ERROR: Variable not supported ("+argument1+").");
   exit;
  break;

end;


