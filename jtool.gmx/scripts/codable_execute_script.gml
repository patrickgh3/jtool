///codable_execute_script(Script name, Argument array)
//Extension of nsp_execute_script. DO NOT CALL THIS DIRECTLY
//add any GML scripts here that you want to support.

switch (argument0) {
    case "instance_create":
        return codable_instance_create(argument1[0],argument1[1],argument1[2]);
  
    case "instance_destroy":
        instance_destroy();
        return 0;
  
    case "instance_nearest":
        return instance_nearest(argument1[0],argument1[1],argument1[2]);

    case "place_meeting":
        return instance_nearest(argument1[0],argument1[1],argument1[2]);

    default:
        return undefined;
}
