var dir = argument0 // 1 or -1

if instance_exists(oPlayer) {
    var onblock;
    with oPlayer onblock = place_meeting(x,y+global.grav,oBlock)
    if onblock {
        oPlayer.x += 0.5 * dir
    }
}
