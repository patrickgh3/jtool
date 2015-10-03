if not stringIsInt(global.input_string) exit

var snap = real(global.input_string)
if snap >= 1 and snap <= 32 {
    oEdit.snap = snap
    saveConfig()
}
