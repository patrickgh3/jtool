///codable_add_code(instance,code)
//Adds a string of code to a codable object
var inst = argument0
var code = argument1
with (inst) {
    code_step_written=code
    code_step_compiled=NSP_save(string_replace_all(code,'#','; '))
}
