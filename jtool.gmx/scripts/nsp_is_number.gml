///nsp_is_number(String)
/*
Underlying NSP script.
NOTE: Takes in account digits from 0 to 9, minus and dot signs.
*/
var i;

if string_digits(argument0)=""
 return false;

if string_copy(argument0,1,1)="-"
 argument0=string_delete(argument0,1,1);

for (i=1; i<=string_length(argument0); i+=1) begin
 if !(string_copy(argument0,i,1)="." or
      (ord(string_copy(argument0,i,1))>=48 and
       ord(string_copy(argument0,i,1))<=57)) 
  return false;

end;

return true;

