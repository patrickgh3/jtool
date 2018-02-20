///nsp_get_token_type(Token, Following Token)
/*
Underlying NSP script.
Returns: Type of provided token (-1 if unknown)
*/
var nspToken=global.nspToken;
var a, token, token_next;

token = argument0;
token_next = argument1;
 
 if token == "{" or token == "}"
 or token == "(" or token == ")"
 or token == "," or token == ";" {
 
  return NSP_TYPE._symbol;
  
  }
  else if token == nspToken[NSP_TOK.equal]
       or token == nspToken[NSP_TOK.unequal]
       or token == nspToken[NSP_TOK.larger]
       or token == nspToken[NSP_TOK.larger_equal]
       or token == nspToken[NSP_TOK.smaller]
       or token == nspToken[NSP_TOK.smaller_equal]
       or token == nspToken[NSP_TOK._and]
       or token == nspToken[NSP_TOK._or]
       or token == nspToken[NSP_TOK._xor]
       or token == nspToken[NSP_TOK.add]
       or token == nspToken[NSP_TOK.subtract]
       or token == nspToken[NSP_TOK.multiply]
       or token == nspToken[NSP_TOK.divide]
       or token == nspToken[NSP_TOK._mod]
       or token == nspToken[NSP_TOK._div]
       or token == nspToken[NSP_TOK._power]
       or token == nspToken[NSP_TOK.assign] {
       
   return NSP_TYPE._operator;
   
   }
   else if nsp_is_number(token) {
   
    return NSP_TYPE._number;
    
    }
    else if nsp_is_string(token) {
    
     return NSP_TYPE._string;
     
     }
     else if nsp_is_special_word(token) {
     
      return NSP_TYPE._specword;

      }
      else if (token_next  ==  "(") {
      
       return NSP_TYPE._script;

       }
       else if nsp_is_asset(token) {
       
        return NSP_TYPE._asset;

        }
        else if nsp_is_dsm(token) {
        
         return NSP_TYPE._dsm;

         }
         else {
         
          a = nsp_is_variable(token);
          
          if (a == 1)
           return NSP_TYPE._variablesl;
           
          if (a == 2)
            return NSP_TYPE._variablecl;
            
          if (a == 3)
            return NSP_TYPE._variablegl;
          
          }
 
 return -1;

