// Calculate if bunny hops were timed early, late, or perfectly.

bhcount += 1

var player_on_ground = false
with oPlayer {
    player_on_ground = (place_meeting(x,y+global.grav,oBlock)
    and place_meeting(x,y+global.grav,oBlock))
}

if global.frameaction_jump {
    bhop_show = false
}

// press jump before hitting ground
// simulate player to find out how many frames it would have taken to hit the ground
if keyboard_check_pressed(vk_shift) and not global.frameaction_jump and instance_exists(oPlayer) {
    var realplayer = oPlayer
    var playersim
    with oPlayer playersim = instance_copy(true)
    playersim.y = realplayer.yprevious
    playersim.vspeed = bhop_vspeedprevious
    
    var numsteps = 0
    with playersim {
        var on_ground = false
        while not on_ground and numsteps < 10 {
            numsteps += 1
            y += vspeed
            vspeed += gravity
            if vspeed > maxVspeed vspeed = maxVspeed
            on_ground = (place_meeting(x,y+global.grav,oBlock)
            and place_meeting(x,y+global.grav,oBlock))
        }
        instance_destroy()
    }
    
    if numsteps <= bhop_hintcutoff {
        bhop_show = true
        bhop_offset = -numsteps
    }
}

// press jump after on ground for a while
if player_on_ground and not bhop_waitinglate {
    bhop_waitinglate = true
    bhcount = -1
}
if bhop_waitinglate and global.frameaction_jump {
    if bhcount <= bhop_hintcutoff {
        bhop_show = true
        bhop_offset = bhcount
    }
    bhop_waitinglate = false
}
if not player_on_ground {
    bhop_waitinglate = false
}

if instance_exists(oPlayer) bhop_vspeedprevious = oPlayer.vspeed
