///nsp_variable_global_set_new(Name, Value)
/*
Underlying NSP script.
*/
var varname, val;

varname = argument[0];
val = argument[1];

if (is_string(val) and nsp_is_string(val)) {

  val = string_copy(val, 2, string_length(val)-2);
  
  }
 
if (string_copy(varname, 1, 7) == "global.") {

  varname=string_delete(varname, 1, 7);

  }
 
variable_global_set(varname, val);

