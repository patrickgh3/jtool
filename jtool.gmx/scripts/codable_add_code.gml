///codable_add_code(instance,code)
//Adds a string of code to a codable object

var inst = argument0
var code = argument1
with (inst) {
    //keep the original written string for the user
    code_step_written=code
    
    //remove blank lines
    while (string_count("##",code)>0) 
        code = string_replace_all(code,'##','#')
    //turn lines into statements (separated by semicolons)
    code = string_replace_all(code,'#','; ')
    //compile the code into a list of tokens and save the handle
    code_step_compiled=NSP_save(code)
}
