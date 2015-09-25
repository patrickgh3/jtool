// Moves the player 1px horizontally using A / D, and 0.01 px vertically using W / S.
// Also jump to mouse position using space.
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
    if keyboard_check_pressed(vk_space)
    and mouse_x >= 0 and mouse_x < 800 and mouse_y >= 0 and mouse_y < 608 {
        x = mouse_x
        y = mouse_y
        vspeed = 0
        djump = true
    }
}
