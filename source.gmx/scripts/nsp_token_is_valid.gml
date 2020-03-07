///nsp_token_is_valid(Token, Surrounding)
/*
Underlying NSP script.
*/
var ord1, ord2;

if (string_letters(argument0) != argument0) return true;

ord1 = ord( string_copy(argument1,1,1) );
ord2 = ord( string_copy(argument1,string_length(argument1),1) );

// 65 - 90  Letters
// 97 - 122 Letters
// 48 - 57  Digits
// 95       Underscore

if ((ord1 >= 65 and ord1 <= 90) or (ord1 >= 97 and ord1 <= 122)
    or (ord1 == 95))
  return false;

if ((ord2 >= 65 and ord2 <= 90) or (ord2 >= 97 and ord2 <= 122)
    or (ord2 == 95) or (ord2 >= 48 and ord2 <= 57))
  return false;
 
return true;

