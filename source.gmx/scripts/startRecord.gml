global.deathEnabled = false 
with oRecordPlayer {instance_destroy();}

//if not instance_exists(oPlayer) {loadPlayer() }
with oPlayer djump = global.restartWithDJump;
with oJumpRefresher count = 0
with oKiller highlight_count = 1000
with oWarp highlight_count = 1000
codable_room_restart()

clearRecordList();
if instance_exists(oPlayer) {
global.recordX = oPlayer.x;
global.recordY = oPlayer.y;
global.recordGrav = global.grav;
global.recordXscale = global.player_xscale; 
global.recordVspeed = 0}

else if global.paused = false { 
loadPlayer()
global.recordX = oPlayer.x;
global.recordY = oPlayer.y;
global.recordGrav = global.grav;
global.recordXscale = global.player_xscale; 
global.recordVspeed = 0}

else if global.paused = true {
global.recordX = global.pausedX;
global.recordY = global.pausedY;
global.recordGrav = global.pausedgrav;
global.recordXscale = global.pausedplayer_xscale;
global.recordVspeed = global.pausedVspeed}

global.record = 1;
        

