if not stringIsInt(global.input_string) 
or not global.input_bool exit

var snap = real(global.input_string)
if snap >= 1 and snap <= 32 {
    oEdit.snap = snap
    saveConfig()
}
