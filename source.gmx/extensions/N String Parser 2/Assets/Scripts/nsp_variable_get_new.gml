///nsp_variable_get_new(Instance, Variable)
/*
Underlying NSP script.
*/
var nspToken = global.nspToken;
var inst, varname, val;

inst = argument[0];
varname = argument[1];

//DEBUG:
//show_message("Fetching "+varname+" -> "+nsp_string_force(variable_instance_get(inst, varname)));

if (inst < 10000) {

  if (instance_number(inst) == 0) {
    NSP_notify("SCRIPT: nsp_variable_get_new. ERROR: Trying to reference non-existing instance.");
    exit;
    }
    
  inst = instance_find(inst, 0);

  }

if (!instance_exists(inst)) {

  NSP_notify("SCRIPT: nsp_variable_get_new. ERROR: Trying to reference non-existing instance.");
  return nspToken[NSP_TOK.abort];
  
  }

if (!variable_instance_exists(inst, varname)) {

  NSP_notify("SCRIPT: nsp_variable_get_new. ERROR: Trying to fetch a non-existant variable ( "+varname+" ).");
  return nspToken[NSP_TOK.abort];

  }

return variable_instance_get(inst, varname);
