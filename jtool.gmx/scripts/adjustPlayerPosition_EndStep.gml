// Moves the player 1px horizontally using A / D, and 0.01 px vertically using W / S.
// To be called by an object every End Step.

with oPlayer {
    if place_meeting(x,round(y+(global.grav)),oBlock) and not frozen {
        if keyboard_check_pressed(ord('A')) and not place_meeting(x-1,y,oBlock) {
            x -= 1
        }
        if keyboard_check_pressed(ord('D')) and not place_meeting(x+1,y,oBlock) {
            x += 1
        }
        
        // not sure if there's a better way to do this
        if keyboard_check_pressed(ord('W')) {
            instance_destroy()
            instance_create(x,y-0.01,oPlayer)
        }
        if keyboard_check_pressed(ord('S')) {
            instance_destroy()
            var yy = y
            if y mod 1 > 0.49 yy -= 0.4
            instance_create(x,yy+0.01,oPlayer)
        }
    }
}