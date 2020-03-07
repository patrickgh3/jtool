///nsp_list_set_types(Token List, Types List)
/*
Underlying NSP script.
Returns: 1 = Success, 0 = Failure
*/
var i, a, tok_list, typ_list;

tok_list = argument0;
typ_list = argument1;

for (i = 0; i < ds_list_size(tok_list)-1; i += 1) {
  
  a = nsp_get_token_type(tok_list[|i], tok_list[|i+1]);
  
  //DEBUG:
  //show_message("Type of | "+tok_list[|i]+" | = "+nsp_type_name(a));
  
  if (a == -1) return 0;

  ds_list_add(typ_list, a);

  }
  
a = nsp_get_token_type(tok_list[|i], "");

//DEBUG:
//show_message("Type of | "+tok_list[|i]+" | = "+nsp_type_name(a));

if (a == -1) return 0;

ds_list_add(typ_list, a);

return 1;
