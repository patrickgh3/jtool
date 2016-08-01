///codable_instance_create(x,y,obj)
//creates an instance, and tags it as being created dynamically
//for instance, we want to destroy all dynamic objects on restart

var inst = instance_create(argument0,argument1,argument2)
ds_list_add(global.dynamic_instance_list,inst)
return inst
