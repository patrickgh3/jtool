with oPlayer instance_destroy()
with oPlayerBlood instance_destroy()
global.grav = global.saveGrav
global.player_djump = true
global.player_xscale = global.savePlayerXScale
instance_create(global.savePlayerX, global.savePlayerY, oPlayer)
//room_goto(global.saveRoom)