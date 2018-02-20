///nsp_token_is_valid(Token, Surrounding)
/*
Underlying NSP script.
*/
var char1,char2;

if string_letters(argument0)<>argument0 return true;

char1=string_copy(argument1,1,1);
char2=string_copy(argument1,string_length(argument1),1);

if string_letters(char1)<>char1 &&
   string_letters(char2)<>char2
 return true;
 
return false;

