///nsp_variable_global_set_br(Variable, Value)
/*
Underlying NSP script.
*/

if (NSP_VAR_SYS.new == 1) {

  nsp_variable_global_set_new(argument0, argument1);

  }
else {

  nsp_variable_global_set(argument0, argument1);

  }
