// comboBoxButton(x,y,w,h,text,object_id)

var xx = argument0
var yy = argument1
var w = argument2
var h = argument3
var text = argument4
var object_id = argument5

var mouse_hover = point_in_rect(mouse_x,mouse_y,xx,yy,xx+w,yy+h)
drawButton(xx,yy,w,h,mouse_hover)
fontSetup(font_small,c_black,fa_left,fa_top,1)
draw_text(xx+5,yy+5,text)

var clicked = mouse_hover and mouse_check_button_pressed(mb_left)
if clicked {
    with object_id {
        selected = not selected
        global.comboboxselected = selected
    }
}
