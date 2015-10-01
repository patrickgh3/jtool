// Calculates how many frames jumps, rejumps, and pauses are.

jcount += 1

var player_on_ground = false
with oPlayer {
    player_on_ground = (place_meeting(floor(x),round(y+(global.grav)),oBlock)
    and place_meeting(ceil(x),round(y+(global.grav)),oBlock))
}

if global.frameaction_jump {
    jumpstate = jstate_1hold
    framecount_jump1 = 0
    framecount_pause = 0
    framecount_jump2 = 0
    framecount_pause2 = 0
    jcount = 1
}
else if global.frameaction_djump {
    if jumpstate == jstate_1hold {
        framecount_jump1 = jcount
    }
    else if jumpstate == jstate_1wait {
        framecount_pause = jcount
    }
    jumpstate = jstate_2hold
    jcount = 1
}

if global.frameaction_jumpslow {
    if jumpstate == jstate_1hold {
        jumpstate = jstate_1wait
        framecount_jump1 = jcount
        jcount = 0
    }
    else if jumpstate == jstate_2hold {
        jumpstate = jstate_2wait
        framecount_jump2 = jcount
    }
}

if (jumpstate == jstate_2wait or jumpstate == jstate_1wait) and player_on_ground {
    jumpstate = jstate_done
    framecount_pause2 = jcount + 1
}

// full frame jumps
if flag_lastjumpframenext {
    flag_lastjumpframenext = false
    if jumpstate == jstate_1hold {
        jumpstate = jstate_1wait
        framecount_jump1 = jcount
    }
    else if jumpstate == jstate_2hold {
        jumpstate = jstate_2wait
        framecount_jump2 = jcount
    }
    jcount = 0
}

if instance_exists(oPlayer) {
    var player_dy = oPlayer.y - oPlayer.yprevious
    var moved_down = (global.grav == 1 and player_dy > 0)
                     or (global.grav == -1 and player_dy < 0)
    if moved_down and (jumpstate == jstate_1hold or jumpstate == jstate_2hold)
    and not global.frameaction_jumpslow {
        flag_lastjumpframenext = true
    }
}
