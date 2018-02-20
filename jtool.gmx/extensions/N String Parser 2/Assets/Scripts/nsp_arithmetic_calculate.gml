///nsp_arithmetic_calculate(Value 1, Value 2, Token)
/*
Underlying NSP script.
NOTE: Add error checking for incompatible data types.
*/
var nspToken=global.nspToken;

//Add:
if argument2=nspToken[NSP_TOK.add] {

 //DEBUG:
 //show_message("Arg0: "+nsp_string_force(argument0)+", isString: "+string(is_string(argument0)));
 //show_message("Arg1: "+nsp_string_force(argument1)+", isString: "+string(is_string(argument1)));

 if is_string(argument0) {
  if nsp_is_number(argument0)
   argument0=real(argument0)
   else argument0=string_delete(argument0,string_length(argument0),1);
  }
 
 if is_string(argument1) {
  if nsp_is_number(argument1)
   argument1=real(argument1)
   else argument1=string_delete(argument1,1,1);
  }
   
 //DEBUG: 
 //show_message("Arg0: "+nsp_string_force(argument0)+", isString: "+string(is_string(argument0)));
 //show_message("Arg1: "+nsp_string_force(argument1)+", isString: "+string(is_string(argument1)));
  
 return nsp_string_force(argument0+argument1);
 
 }
 
//Convert arguments for following functions:
if is_string(argument0)
 argument0=real(argument0);
if is_string(argument1)
 argument1=real(argument1);
  
//Subtract:
if argument2=nspToken[NSP_TOK.subtract] {

   return string(argument0-argument1);
   
   }

//Divide:
if argument2=nspToken[NSP_TOK.divide] {

   return string(argument0/argument1);
   
   }

//Multiply:
if argument2=nspToken[NSP_TOK.multiply] {

   return string(argument0*argument1);
   
   }
   
//Modulo:
if argument2=nspToken[NSP_TOK._mod] {

   return string(argument0 mod argument1);
   
   }
   
//Div:
if argument2=nspToken[NSP_TOK._div] {

   return string(argument0 div argument1);
   
   }
   
//Power:
if argument2=nspToken[NSP_TOK._power] {

   return string(power(argument0,argument1));
   
   }

