///nsp_variable_global_get_br(Variable)
/*
Underlying NSP script.
*/

if (NSP_VAR_SYS.new == 1) {

  return nsp_variable_global_get_new(argument0);

  }
else {

  return nsp_variable_global_get(argument0);

  }
