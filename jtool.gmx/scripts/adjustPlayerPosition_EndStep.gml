/* Shortcut keys to conveniently move the player.
   To be called by an object every End Step.

   Nudge 1px horizontally using A / D.
   Jump to mouse position using W.
   Save at current position using S.
*/

with oPlayer {
    var isOnBlock;
    if( global.checkNudgeEarly ) {
        isOnBlock = nudgeBlockCheck;
    } else {
        isOnBlock = place_meeting(x,y+global.grav,oBlock);
    }
    if isOnBlock and not frozen {
        if keyboard_check_pressed(ord('A')) and not place_meeting(x-1,y,oBlock) {
            x -= 1
        }
        if keyboard_check_pressed(ord('D')) and not place_meeting(x+1,y,oBlock) {
            x += 1
        }
    }
}

if keyboard_check_pressed(ord('W'))
and mouse_x >= 0 and mouse_x < 800 and mouse_y >= 0 and mouse_y < 608 {
    if not instance_exists(oPlayer) loadPlayer()
    with oPlayer {
        x = mouse_x
        y = mouse_y
        vspeed = 0
        djump = true
    }
}

if (keyboard_check_pressed(ord('S')) and not keyboard_check(vk_control))
and instance_exists(oPlayer) {
    savePlayer()
    audio_play_sound(sndShoot,0,false)
    with oPlayer instance_create(x-17,y-23,oKeySaveParticle)
}

if keyboard_check_pressed(ord('V')) and instance_exists(oPlayer) {
    var onblock;
    with oPlayer onblock = place_meeting(x,y+global.grav,oBlock)
    if onblock {
        inputOverlay(input_textbox,inputCallback_VAlign,
            'Valign (was '+string(oPlayer.y-floor(oPlayer.y))+')')
        oInputOverlay.textbox_label = '0.'
    }
}
