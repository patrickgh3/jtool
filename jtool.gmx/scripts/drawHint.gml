

var xx = argument0
var yy = argument1
var w = argument2
var label = argument3
var time = argument4
var show = argument5

fontSetup(font_small,c_black,fa_left,fa_top,1)
draw_text(xx+5,yy+5,label)

var num_ticks = 3
var line_xcenter = xx+w/2
var line_length = w*0.8
var tick_length = line_length/2/num_ticks
var line_y = yy+32

draw_line(line_xcenter-line_length/2,line_y,
          line_xcenter+line_length/2,line_y)
draw_line(line_xcenter,line_y-6,line_xcenter,line_y+5)

if show {
    var cursorcolor
    if time == 0 cursorcolor = c_white
    else if time > 0 cursorcolor = 16748614
    else if time < 0 cursorcolor = 4634111
    draw_sprite_ext(sHintCursor,0,line_xcenter+time*tick_length,line_y+7,
    1,1,0,cursorcolor,1)
    
    var str = string(abs(time))+' f '
    if time == 0 str = 'good'
    else if time < 0 str += 'early'
    else if time > 0 str += 'late'
    draw_text(xx+5,yy+40,str)
}
