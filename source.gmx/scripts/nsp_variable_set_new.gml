///nsp_variable_set_new(Instance, Variable, Value)
/*
Underlying NSP script.
*/
var inst, varname, val;

inst = argument[0];
varname = argument[1];
val = argument[2];

//DEBUG:
//show_message("Setting "+varname+" to "+nsp_string_force(val));

if (inst < 10000) {

  if (instance_number(inst) == 0) {
    NSP_notify("SCRIPT: nsp_variable_set_new. ERROR: Trying to reference non-existing instance.");
    exit;
    }
    
  inst = instance_find(inst, 0);

  }

if (!instance_exists(inst)) {

  NSP_notify("SCRIPT: nsp_variable_set_new. ERROR: Trying to reference non-existing instance.");
  exit;
 
  }

if (is_string(val) and nsp_is_string(val)) {

  val = string_copy(val, 2, string_length(val)-2);
  
  }
 
variable_instance_set(inst, varname, val);

