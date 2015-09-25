// initial save
global.saveRoom = rMain
global.savePlayerX = 100
global.savePlayerY = 100
global.saveGrav = 1
global.savePlayerXScale = 1

// state variables
global.gameStarted = 0
global.grav = 1
global.adAlign = false
global.noDeath = false
global.showDebug = false
global.player_xscale = 1
global.edgeDeath = true

// misc
global.startRoom = rMain
randomize()
display_set_gui_size(view_wview[0],view_hview[0])
window_set_caption("jump tool")
for (var i=0; i < 100; i+=1) {
    global.trigger[i] = 0
}