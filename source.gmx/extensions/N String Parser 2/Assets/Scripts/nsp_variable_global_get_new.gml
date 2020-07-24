///nsp_variable_global_get_new(Name)
/*
Underlying NSP script.
*/
var nspToken = global.nspToken;
var varname;

varname = argument[0];

if (string_copy(varname, 1, 7) == "global.") {

  varname = string_delete(varname, 1, 7);

  }
  
if (!variable_global_exists(varname)) {

  NSP_notify("SCRIPT: nsp_variable_global_get_new. ERROR: Trying to fetch a non-existant global variable ("+varname+").");
  return nspToken[NSP_TOK.abort];
  
  }
 
return variable_global_get(varname);

