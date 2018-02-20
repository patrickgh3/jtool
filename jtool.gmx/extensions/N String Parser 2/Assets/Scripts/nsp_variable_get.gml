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

 case "id":
  return (argument0).id;
 break;

 case "x":
   return (argument0).x;
  break;
 
 case "y":
   return (argument0).y;
  break;
  
 case "a":
   return (argument0).a;
  break;
  
 case "b":
   return (argument0).b;
  break;
  
 case "c":
   return (argument0).c;
  break;
  
 case "d":
   return (argument0).d;
  break;
  
 case "i":
   return (argument0).i;
  break;
  
 case "t":
   return (argument0).t;
  break;
  
 case "z":
   return (argument0).z;
  break;
  
 case "counter":
   return (argument0).counter;
  break;
  
 case "hspeed":
   return (argument0).hspeed;
  break;
 
 case "vspeed":
   return (argument0).vspeed;
  break;
 
 case "speed":
   return (argument0).speed;
  break;
 
 case "direction":
   return (argument0).direction;
  break;
  
 case "image_angle":
   return (argument0).image_angle;
  break;
 
 case "image_index":
   return (argument0).image_index;
  break;
 
 case "image_speed":
   return (argument0).image_speed;
  break;
 
 case "sprite_index":
   return (argument0).sprite_index;
  break;
 
 case "object_index":
   return (argument0).object_index;
  break;
 
 case "_hspeed":
   return (argument0)._hspeed;
  break;
 
 case "_vspeed":
   return (argument0)._vspeed;
  break;
 
 case "_health":
   return (argument0)._health;
  break;
 
 default:
   NSP_notify("SCRIPT: nsp_variable_get. ERROR: Variable not supported ("+argument1+").");
   return nspToken[NSP_TOK.abort];
  break;

end;

