///codable_execute_script(Script name, Argument array)
//Extension of nsp_execute_script. DO NOT CALL THIS DIRECTLY
//add any GML scripts here that you want to support.

switch (argument0) {
    //instance functions
    case "instance_create":  return codable_instance_create(argument1[0],argument1[1],argument1[2]);
    case "instance_destroy": instance_destroy(); return 0;
    case "instance_nearest": return instance_nearest(argument1[0],argument1[1],argument1[2]);
    case "instance_exists":  return instance_exists(argument1[0]);
    case "place_meeting":    return place_meeting(argument1[0],argument1[1],argument1[2]);
    
    //math functions
    case "sin":              return sin(argument1[0]);
    case "cos":              return cos(argument1[0]);
    case "tan":              return tan(argument1[0]);
    
    //these can cause errors if the inputs are outside of the domain, so I'm leaving them disabled for now
    //case "arcsin":           return arcsin(argument1[0]);
    //case "arccos":           return arccos(argument1[0]);
    //case "arctan":           return arctan(argument1[0]);
    case "arctan2":          return arctan2(argument1[0],argument1[1]);
    
    case "degtorad":         return degtorad(argument1[0]);
    case "radtodeg":         return degtorad(argument1[0]);
    
    case "abs":              return abs(argument1[0]);
    case "floor":            return floor(argument1[0]);
    case "ceil":             return ceil(argument1[0]);
    case "round":            return round(argument1[0]);
    case "sqrt":             return sqrt(argument1[0]);
    
    //these can take unlimited arguments, only allowing 2 for now
    case "min":              return min(argument1[0],argument1[1]); 
    case "max":              return max(argument1[0],argument1[1]);
    
    case "random":           return random(argument1[0]);
    case "irandom":          return irandom(argument1[0]);
    case "random_range":     return random_range(argument1[0],argument1[1]);
    case "irandom_range":    return irandom_range(argument1[0],argument1[1]);
    
    case "lengthdir_x":      return lengthdir_x(argument1[0],argument1[1]);
    case "lengthdir_y":      return lengthdir_y(argument1[0],argument1[1]);
    
    case "point_distance":   return point_distance(argument1[0],argument1[1],argument1[2],argument1[3]);
    case "point_direction":  return point_direction(argument1[0],argument1[1],argument1[2],argument1[3]);
    default:return undefined;
}
