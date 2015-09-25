var xx = argument0
var yy = argument1
var dy = argument2

fontSetup(font_small,c_black,fa_left,fa_top,1)
var xo = 20

draw_text(xx,yy,'C')
var num_ticks = 4
var line_xcenter = xx+50
var line_length = 60
var tick_length = line_length/2/num_ticks
var line_y = yy+11

draw_line(line_xcenter-line_length/2,line_y,
          line_xcenter+line_length/2,line_y)
for (var i=0; i<num_ticks+1; i++) {
    var xx1 = line_xcenter+i*tick_length
    var xx2 = line_xcenter-i*tick_length
    var dyy = 3
    if i == 0 dyy = 7
    var yy1 = line_y-dyy
    var yy2 = line_y+dyy-1
    draw_line(xx1,yy1,xx1,yy2)
    draw_line(xx2,yy1,xx2,yy2)
}
if jc_show {
    var cursorcolor
    if jc_duration > 0 cursorcolor = 4634111
    else if jc_duration < 0 cursorcolor = 16748614
    else if jc_duration == 0 cursorcolor = c_white
    draw_sprite_ext(sHintCursor,0,line_xcenter+jc_duration*tick_length,line_y+8,
    1,1,0,cursorcolor,1)
    
    draw_text(xx+90,yy,jc_duration)
}
/*yy += dy*2
if jc_show and jc_duration == 0 and not jc_successwaitingforrelease {
    draw_text(xx+xo2,yy,'dur: '+string(jc_successduration))
}*/