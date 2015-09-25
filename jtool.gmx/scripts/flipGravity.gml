with oPlayer {
    global.grav *= -1
    djump = 1
    vspeed = 0
    jump = 8.5 * global.grav
    jump2 = 7 * global.grav
    gravity = 0.4 * global.grav
    if global.grav == 1 {
        mask_index = sPlayerMask
    }
    else {
        mask_index = sPlayerMaskFlip
    }
    y += 5*global.grav // used to be 4, but got stuck in ground???
}