if vspeed*global.grav < 0 {
    vspeed *= 0.45
    global.frameaction_jumpslow = true
}
