///nsp_execute_script(Script name, Argument array)
/*
Underlying NSP script. Can be changed by user (read NSP Documentation for more info).
*/
var nspToken=global.nspToken;
var rv,a;

//See if any arguments are strings and convert if necessary:
if is_array(argument1) {

 for (i=0; i<array_length_1d(argument1); i+=1) begin
 
  if is_string(argument1[i]) {
   if nsp_is_string(argument1[i])
    argument1[i]=string_copy(argument1[i],2,string_length(argument1[i])-2);
   }
 
 end;

 }
 
//PART 1 (Built-in scripts): ------------------------------------------------------------------------------------------
switch (argument0) begin

 case "show_message":
  show_message(argument1[0]);
  return 0;
  
 case "sqr":
  return sqr(argument1[0]);
  
 case "sqrt":
  return sqrt(argument1[0]);
  
  // Add more here...

 default:
   if asset_get_type(argument0)<>asset_script {
    NSP_notify("SCRIPT: nsp_execute_script. ERROR: Script not supported ( "+argument0+" ).");
    return nspToken[NSP_TOK.abort];
    }
  break;
  
end;

//PART 2 (Custom scripts): --------------------------------------------------------------------------------------------

argument0=asset_get_index(argument0);

if is_array(argument1)
 a=array_length_1d(argument1)
 else a=0;

switch (a) begin

 case 0:
   rv=script_execute(argument0);
  break;

 case 1:
   rv=script_execute(argument0,argument1[0]);
  break;
  
 case 2:
   rv=script_execute(argument0,argument1[0],argument1[1]);
  break;
  
 case 3:
   rv=script_execute(argument0,argument1[0],argument1[1],argument1[2]);
  break;
  
 case 4:
   rv=script_execute(argument0,argument1[0],argument1[1],argument1[2],argument1[3]);
  break;
  
 case 5:
   rv=script_execute(argument0,argument1[0],argument1[1],argument1[2],argument1[3],argument1[4]);
  break;
  
 case 6:
   rv=script_execute(argument0,argument1[0],argument1[1],argument1[2],argument1[3],argument1[4],argument1[5]);
  break;
  
 case 7:
   rv=script_execute(argument0,argument1[0],argument1[1],argument1[2],argument1[3],argument1[4],argument1[5],argument1[6]);
  break;
  
 case 8:
   rv=script_execute(argument0,argument1[0],argument1[1],argument1[2],argument1[3],argument1[4],argument1[5],argument1[6],argument1[7]);
  break;
  
 case 9:
   rv=script_execute(argument0,argument1[0],argument1[1],argument1[2],argument1[3],argument1[4],argument1[5],argument1[6],argument1[7],argument1[8]);
  break;
  
 case 10:
   rv=script_execute(argument0,argument1[0],argument1[1],argument1[2],argument1[3],argument1[4],argument1[5],argument1[6],argument1[7],argument1[8],argument1[9]);
  break;
  
 case 11:
   rv=script_execute(argument0,argument1[0],argument1[1],argument1[2],argument1[3],argument1[4],argument1[5],argument1[6],argument1[7],argument1[8],argument1[9],argument1[10]);
  break;
  
 case 12:
   rv=script_execute(argument0,argument1[0],argument1[1],argument1[2],argument1[3],argument1[4],argument1[5],argument1[6],argument1[7],argument1[8],argument1[9],argument1[10],argument1[11]);
  break;
  
 case 13:
   rv=script_execute(argument0,argument1[0],argument1[1],argument1[2],argument1[3],argument1[4],argument1[5],argument1[6],argument1[7],argument1[8],argument1[9],argument1[10],argument1[11],argument1[12]);
  break;
  
 case 14:
   rv=script_execute(argument0,argument1[0],argument1[1],argument1[2],argument1[3],argument1[4],argument1[5],argument1[6],argument1[7],argument1[8],argument1[9],argument1[10],argument1[11],argument1[12],argument1[13]);
  break;
  
 case 15:
   rv=script_execute(argument0,argument1[0],argument1[1],argument1[2],argument1[3],argument1[4],argument1[5],argument1[6],argument1[7],argument1[8],argument1[9],argument1[10],argument1[11],argument1[12],argument1[13],argument1[14]);
  break;

 default:
   NSP_notify("SCRIPT: nsp_execute_script. ERROR: Too many arguments.");
   return nspToken[NSP_TOK.abort];
  break;
 
end;

return rv;

