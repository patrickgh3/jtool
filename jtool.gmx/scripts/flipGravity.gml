with oPlayer {
    global.grav *= -1
    djump = 1
    vspeed = 0
    jump = 8.5 * global.grav
    jump2 = 7 * global.grav
    gravity = 0.4 * global.grav
    if not global.dotkid {
        if global.grav == 1 {
            mask_index = sPlayerMask
        }
        else {
            mask_index = sPlayerMaskFlip
        }
    }
    y += 4*global.grav
}
