// comboBoxButton(x,y,w,h,droph,text)

var xx = argument0
var yy = argument1
var w = argument2
var h = argument3
var droph = argument4
var text = argument5

var mouse_hover = point_in_rect(mouse_x,mouse_y,xx,yy,xx+w,yy+h)
and global.state == globalstate_idle

drawButton(xx,yy,w,h,mouse_hover)
fontSetup(font_small,c_black,fa_left,fa_top,1)
draw_text(xx+5,yy+5,text)

var clicked = mouse_hover and mouse_check_button_pressed(mb_left)
if clicked {
    selected = not selected
    global.comboboxselected = selected
}

if selected
and (mouse_x < x or mouse_x > x+w-1
or mouse_y < y or mouse_y > y+h+droph-1
or global.state != globalstate_idle) {
    selected = false
    global.comboboxselected = false
}
