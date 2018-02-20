///nsp_get_constant(String)
/*
Underlying NSP script. Can be changed by user (read NSP Documentation for more info).
*/
var work_str;

work_str = argument0;

switch (work_str) begin

 //Boolean:
 case "true": return true;
 
 case "false": return false;

 //Mouse:
 case "mb_left": return mb_left;
 
 case "mb_right": return mb_right;
 
 case "mb_middle": return mb_middle;
 
 //Keyboard:
 case "vk_right": return vk_right;
 
 case "vk_left": return vk_left;
 
 case "vk_up": return vk_up;
 
 case "vk_down": return vk_down;
 
 case "vk_enter": return vk_enter;
 
 //If not a defined constant:
 default: return -9999;

end;
