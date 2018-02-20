///nsp_is_special_word(String)
/*
Underlying NSP script.
*/

switch (argument0) begin

 case "self": return true;
 
 case "other": return true;
  
 case "with": return true;
  
 case "repeat": return true;
  
 case "if": return true;
 
 case "else": return true;
  
 case "while": return true;
 
 case "begin": return true;
 
 case "end": return true;
 
 case "return": return true;
 
 default: return false;

end;

