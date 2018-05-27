with oRecordPlayer {
    grav *= -1
    djump = 1
    vspeed = 0
    jump = 8.5 * grav
    jump2 = 7 * grav
    gravity = 0.4 * grav
    if not global.dotkid {
        if grav == 1 {
            mask_index = sPlayerMask
        }
        else {
            mask_index = sPlayerMaskFlip
        }
    }
    y += 4*grav
}
