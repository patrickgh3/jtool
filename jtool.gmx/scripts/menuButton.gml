// Simulates a button with callback script.

// menuButton(x,y,w,h,text,callback,enabled)

var xx = argument0
var yy = argument1
var w = argument2
var h = argument3
var text = argument4
var callback = argument5
var enabled = argument6

if global.comboboxselected {
    enabled = false
}

var mouse_hover = point_in_rect(mouse_x,mouse_y,xx,yy,xx+w,yy+h) and enabled

drawButton(xx,yy,w,h,mouse_hover)
fontSetup(font_small,c_black,fa_center,fa_center,1)
draw_text(xx+w/2,yy+h/2,text)

if mouse_hover and mouse_check_button_pressed(mb_left) {
    script_execute(callback)
}
