///nsp_comparison_calculate(Value 1, Value 2, Token)
/*
Underlying NSP script.
NOTE: Add error checking for incompatible data types.
*/
var nspToken=global.nspToken;

//Equal:
if argument2=nspToken[NSP_TOK.equal] {
    
 return string( (argument0==argument1)*1.0 );
 
 }
 
//Unequal:
if argument2=nspToken[NSP_TOK.unequal] {

 return string( (argument0<>argument1)*1.0 );
   
 }
 
//Convert arguments for following functions:
if is_string(argument0)
 argument0=real(argument0);
if is_string(argument1)
 argument1=real(argument1);
  
//Larger:
if argument2=nspToken[NSP_TOK.larger] {

 return string( (argument0>argument1)*1.0 );
   
 }

//Larger or equal:
if argument2=nspToken[NSP_TOK.larger_equal] {

   return string( (argument0>=argument1)*1.0 );
   
   }

//Smaller:
if argument2=nspToken[NSP_TOK.smaller] {

 return string( (argument0<argument1)*1.0 );
   
 }
   
//Smaller or equal:
if argument2=nspToken[NSP_TOK.smaller_equal] {

 return string( (argument0<=argument1)*1.0 );
   
 }


