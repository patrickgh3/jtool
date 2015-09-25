if (place_meeting(floor(x),round(y+(global.grav)),oBlock) and place_meeting(ceil(x),round(y+(global.grav)),oBlock)) 
or onPlatform
or place_meeting(x,round(y+(global.grav)),oWater) {
    vspeed = -jump
    djump = true
    audio_play_sound(sndJump,0,0)
    global.frameaction_jump = true
}
else if djump
or place_meeting(x,round(y+(global.grav)),oWater2) {
    vspeed = -jump2
    sprite_index = sPlayerJump
    audio_play_sound(sndDJump,0,0)
    global.frameaction_djump = true
    
    if not place_meeting(x,round(y+(global.grav)),oWater3) {
        djump = false
    }
}