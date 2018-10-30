with oWater3 {
if place_meeting(x,y,oPlayer) {
    with oPlayer
    {
        djump = true
        if vspeed*global.grav > 2 {
            vspeed = 2*global.grav
        }
    }
}
if place_meeting(x,y,oRecordPlayer) {
    with oRecordPlayer
    {
        djump = true
        if vspeed*oRecordPlayer.grav > 2 {
            vspeed = 2*oRecordPlayer.grav
        }
    }
}
}
with oWater2 {
if place_meeting(x,y,oPlayer) {
    with oPlayer
    {
        if vspeed*global.grav > 2 {
            vspeed = 2*global.grav
        }
    }
}
if place_meeting(x,y,oRecordPlayer) {
    with oRecordPlayer
    {
        if vspeed*oRecordPlayer.grav > 2 {
            vspeed = 2*oRecordPlayer.grav
        }
    }
}
}
with oWater {
if place_meeting(x,y,oPlayer) {
    with oPlayer
    {
        djump = true
        if vspeed*global.grav > 2 {
            vspeed = 2*global.grav
        }
    }
}

if place_meeting(x,y,oRecordPlayer) {
    with oRecordPlayer
    {
        djump = true
        if vspeed*oRecordPlayer.grav > 2 {
            vspeed = 2*oRecordPlayer.grav
        }
    }
}
}

