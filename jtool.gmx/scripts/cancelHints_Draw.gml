var xx = x
var yy = y
var w = 96
var h = 64

drawButton(xx,yy,w,h,false)

fontSetup(font_small,c_black,fa_left,fa_top,1)
draw_text(xx+5,yy+5,'Cancel')
var num_ticks = 3
var line_xcenter = xx+50
var line_length = 80
var tick_length = line_length/2/num_ticks
var line_y = yy+30

draw_line(line_xcenter-line_length/2,line_y,
          line_xcenter+line_length/2,line_y)
draw_line(line_xcenter,line_y-6,line_xcenter,line_y+5)
/*for (var i=0; i<num_ticks+1; i++) {
    var xx1 = line_xcenter+i*tick_length
    var xx2 = line_xcenter-i*tick_length
    var dyy = 3.5
    if i == 0 dyy = 7
    var yy1 = line_y-dyy
    var yy2 = line_y+dyy-0.5
    //draw_line(xx1,yy1,xx1,yy2)
    draw_line(xx2,yy1,xx2,yy2)
}*/
if jc_show {
    var cursorcolor
    if jc_duration > 0 cursorcolor = 4634111
    else if jc_duration < 0 cursorcolor = 16748614
    else if jc_duration == 0 cursorcolor = c_white
    draw_sprite_ext(sHintCursor,0,line_xcenter+jc_duration*tick_length,line_y+7,
    1,1,0,cursorcolor,1)
    
    var str = string(abs(jc_duration))+' f '
    if jc_duration == 0 str = 'good'
    else if jc_duration < 0 str += 'early'
    else if jc_duration > 0 str += 'late'
    draw_text(xx+5,yy+40,str)
}
