with oRecordPlayer {instance_destroy();}

//loadPlayer()
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
global.recordXscale = global.player_xscale; }
else { 
loadPlayer()
global.recordX = oPlayer.x;
global.recordY = oPlayer.y;
global.recordGrav = global.grav;
global.recordXscale = global.player_xscale; }
global.record = 1;
        

