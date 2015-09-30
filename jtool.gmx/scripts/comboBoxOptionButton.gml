// comboBoxOptionButton(x,y,w,h,text,callback,cb_arg1)

var xx = argument0
var yy = argument1
var w = argument2
var h = argument3
var text = argument4
var callback = argument5
var cb_arg1 = argument6

var mouse_hover = point_in_rect(mouse_x,mouse_y,xx,yy,xx+w,yy+h)
drawButton(xx,yy,w,h,mouse_hover)
fontSetup(font_small,c_black,fa_center,fa_center,1)
draw_text(xx+w/2,yy+h/2,text)

var clicked = mouse_hover and mouse_check_button_pressed(mb_left)
if clicked {
    selected = false
    global.comboboxselected = false
    script_execute(callback,cb_arg1)
}
