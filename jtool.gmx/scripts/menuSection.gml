

// menuSection(x,y,text,drawline)

var xx = argument0
var yy = argument1
var text = argument2
var drawline = argument3

fontSetup(font_big,c_black,fa_left,fa_top,1)
if drawline draw_line(xx-25,y,xx-25,y+menu_height-1)
draw_text(xx+0,yy-45,text)
