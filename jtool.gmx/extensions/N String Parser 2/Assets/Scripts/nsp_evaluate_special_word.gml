///nsp_evaluate_special_word(String)
/*
Underlying NSP script.
*/

switch (argument0) begin

 case "self":
   return self;
  break;
 
 case "other":
   return other;
  break;
 
 default:
  break;

end;

