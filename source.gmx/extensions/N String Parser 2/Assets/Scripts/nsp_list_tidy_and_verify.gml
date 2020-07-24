///nsp_list_tidy_and_verify(Token List, Param List)
/*

Returns: 1 = Success, 0 = Failure

*/
var nspToken = global.nspToken;
var a, tok_list, typ_list;
var i, last;

tok_list = argument0;
typ_list = argument1;

last = ds_list_size(tok_list)-1;
i = last;

while (i >= 0) {

  //DEBUG:
  //show_message(tok_list[|i]+" | i = "+string(i));

  switch (typ_list[|i]) {
  
    case NSP_TYPE._operator:
    
      //Operator at beginning or end:
      if ((i == 0 and tok_list[|i] != "-" and tok_list[|i] != "+") or i == last) {
      
        NSP_notify("SCRIPT: nsp_list_tidy_and_verify. ERROR: Misplaced operator found at beginning or end of string.");
        return 0;
      
        }
    
      //Fix unary minuses:
      if (tok_list[|i] == "-") {
      
        if ((nsp_type_is_a_value(typ_list[|i+1]) or tok_list[|i+1] == "(" ) and
            (i==0 or (!nsp_type_is_a_value(typ_list[|i-1]) and tok_list[|i-1] != ")"))) {
        
          //Replace unary minus with " -1 * "
          
          tok_list[|i] = "-1";
          typ_list[|i] = NSP_TYPE._number;
          
          ds_list_insert(tok_list, i+1, "*");
          ds_list_insert(typ_list, i+1, NSP_TYPE._operator);
          
          last += 1;
      
          }
          
        i -= 1;
        continue;
          
        }
        
      //Fix unary pluses:
      if (tok_list[|i] == "+") {
      
        if ((nsp_type_is_a_value(typ_list[|i+1]) or tok_list[|i+1] == "(" ) //Condition 1: Right-hand token is a value-type
        and (i==0 or !(nsp_type_is_a_value(typ_list[|i-1]) or  tok_list[|i-1] == ")"))) //Condition 2: Left hand token is not a value-type
          {
        
          //Just delete the useless plus
          ds_list_delete(tok_list, i);
          ds_list_delete(typ_list, i);
          last -= 1;
      
          }
          
        i -= 1;
        continue;
          
        }
    
      //Operator at the beginning of string:
      if (i == 0) {
      
        NSP_notify("SCRIPT: nsp_list_tidy_and_verify. ERROR: Misplaced operator found at the beginning of the input string.");
        return 0;
      
        }
       
      //Operator next to another operator: 
      if (typ_list[|i-1] == NSP_TYPE._operator or typ_list[|i+1] == NSP_TYPE._operator) {
        
        //Ignore compound assignment operators:
        if (tok_list[|i] == nspToken[NSP_TOK.assign] and typ_list[|i-1] == NSP_TYPE._operator and typ_list[|i+1] != NSP_TYPE._operator) {
        
          if (tok_list[|i-1] == nspToken[NSP_TOK.add] or
              tok_list[|i-1] == nspToken[NSP_TOK.subtract] or
              tok_list[|i-1] == nspToken[NSP_TOK.multiply] or
              tok_list[|i-1] == nspToken[NSP_TOK.divide]) {
             
            i -= 2;
            continue;
               
            }         
        
          }
      
        NSP_notify("SCRIPT: nsp_list_tidy_and_verify. ERROR: Misplaced operator found at beginning or end of string or next to another operator.");
        return 0;
      
        }
        
      //Operator after non-value:
      if (!nsp_type_is_a_value(typ_list[|i-1])) {
      
        if (tok_list[|i-1] == ")") {
          
          i-= 1;
          continue;
          
          }
      
        NSP_notify("SCRIPT: nsp_list_tidy_and_verify. ERROR: Misplaced operator found after a symbol or keyword.");
        return 0;
      
        }
        
      //No problem found:
      i -= 1;
    
      break;
      
    case NSP_TYPE._symbol:
    
      //Add a semicolon after a closed curly bracket to prevent crashes:
      if (tok_list[|i] == "}" and i!= last and tok_list[|i+1] != ";") {
      
        ds_list_insert(tok_list, i+1, ";");
        ds_list_insert(typ_list, i+1, NSP_TYPE._symbol);
          
        last += 1;
        
        i-=1;
        continue;
      
        }
    
      //No problems found:
      i -= 1;
    
      break;
      
    default:
      i -= 1;
      continue;
      break;
  
    }

  }

return 1;
