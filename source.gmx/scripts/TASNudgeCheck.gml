// Check for block underneath for nudging.
with oPlayer{
if( global.checkNudgeEarly ) {
    nudgeBlockCheck = place_meeting(x,y+global.grav,oBlock);
} else {
    nudgeBlockCheck = false;
}
}
