///nsp_variable_get_br(Instance, Variable)
/*
Underlying NSP script.
*/

if (NSP_VAR_SYS.new == 1) {

  return nsp_variable_get_new(argument0, argument1);

  }
else {

  return nsp_variable_get(argument0, argument1);

  }
