global.savePlayerX = oPlayer.x
global.savePlayerY = oPlayer.y
with oPlayer if not place_free(x,floor(y)) global.savePlayerY += 1
global.saveGrav = global.grav
global.savePlayerXScale = global.player_xscale
