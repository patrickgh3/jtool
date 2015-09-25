var xx = argument0
var yy = argument1
var w = argument2
var h = argument3
var active = argument4

draw_set_alpha(1)
if active draw_set_color(make_color_hsv(0,0,220))
else draw_set_color(make_color_hsv(0,0,175))
draw_rectangle(xx,yy,xx+w-1,yy+h-1,false)
draw_set_color(c_black)
draw_rectangle(xx,yy,xx+w-1,yy+h-1,true)