if instance_number(oPlayerBullet) < 4
{
    var b = instance_create(x,y,oPlayerBullet);
    b.hspeed = global.player_xscale*16
    audio_play_sound(sndShoot,0,0)
}