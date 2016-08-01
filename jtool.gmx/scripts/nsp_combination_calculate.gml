///nsp_combination_calculate(Value 1, Value 2, Token)
/*
NOTE: Add error checking for incompatible data types.
*/
var nspToken=global.nspToken;

//Convert arguments for following functions:
if is_string(argument0)
 argument0=real(argument0);
if is_string(argument1)
 argument1=real(argument1);
 
//And:
if argument2=nspToken[NSP_TOK._and] or argument2=nspToken[NSP_TOK._and2] {
    
 return string( (argument0 and argument1)*1.0 );
 
 }
  
//Or:
if argument2=nspToken[NSP_TOK._or] or argument2=nspToken[NSP_TOK._or2] {

 return string( (argument0 or argument1)*1.0 );
   
 }

//Xor:
if argument2=nspToken[NSP_TOK._xor] {

 return string( (argument0 xor argument1)*1.0 );
   
 }



