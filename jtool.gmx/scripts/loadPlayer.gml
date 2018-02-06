with oPlayer instance_destroy()
with oPlayerBlood instance_destroy()
with oPlayerBloodTypeB instance_destroy()
with oPlayerBloodEmitter instance_destroy()
with oPlayerBloodCharm1 instance_destroy();
audio_stop_sound(global.DeathAudio);
global.grav = global.saveGrav
global.player_djump = true
global.player_xscale = global.savePlayerXScale
instance_create(global.savePlayerX, global.savePlayerY, oPlayer)
