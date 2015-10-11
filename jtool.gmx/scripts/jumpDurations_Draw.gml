var xx = argument0
var yy = argument1
var dy = argument2

fontSetup(font_small,c_black,fa_left,fa_top,1)
var xo = 55

draw_text(xx,yy,'Jump')
if jumpstate == jstate_1wait
or jumpstate == jstate_2hold
or jumpstate == jstate_2wait
or jumpstate == jstate_done {
    draw_text(xx+xo,yy,number_to_frames_string(framecount_jump1))
}
yy += dy
draw_set_alpha(0.3)
draw_text(xx,yy,'Pause')
if jumpstate == jstate_2hold
or jumpstate == jstate_2wait
or jumpstate == jstate_done {
    draw_text(xx+xo,yy,number_to_frames_string(framecount_pause))
}
yy += dy
draw_set_alpha(1)
draw_text(xx,yy,'Djump')
if jumpstate == jstate_2wait
or jumpstate == jstate_done {
    draw_text(xx+xo,yy,number_to_frames_string(framecount_jump2))
}
yy += dy
draw_set_alpha(0.3)
draw_text(xx,yy,'Pause')
if jumpstate == jstate_done {
    draw_text(xx+xo,yy,number_to_frames_string(framecount_pause2))
}
