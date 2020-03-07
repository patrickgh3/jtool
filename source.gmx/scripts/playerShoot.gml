if instance_number(oPlayerBullet) < 4 {
    var by = y
    if mask_index == sDotkid by = y+6
    if not (mask_index == sDotkid) {oPlayer.sprite_index=sPlayerShoot}
    
    var b = instance_create(x,by,oPlayerBullet);
    b.hspeed = global.player_xscale*16
    audio_play_sound(sndShoot,0,0)
}
