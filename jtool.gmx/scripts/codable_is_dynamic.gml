///codable_is_dynamic(instance)
//Returns true if the instance was dynamically created, false if not

return ds_list_find_index(global.dynamic_instance_list,argument0) > -1;
