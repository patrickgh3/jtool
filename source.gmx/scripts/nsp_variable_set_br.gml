///nsp_variable_set_br(Instance, Variable, Value)
/*
Underlying NSP script.
*/

if (NSP_VAR_SYS.new == 1) {

  nsp_variable_set_new(argument0, argument1, argument2);

  }
else {

  nsp_variable_set(argument0, argument1, argument2);

  }


