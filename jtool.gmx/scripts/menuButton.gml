// Draws a button and returns whether or not it was clicked.

// menuButton(x, y, w, h, text, enabled, icon)

var xx = argument0
var yy = argument1
var w = argument2
var h = argument3
var text = argument4
var enabled = argument5
var icon = argument6

var mouse_hover = point_in_rect(mouse_x,mouse_y,xx,yy,xx+w-1,yy+h-1) and enabled

drawButton(xx,yy,w,h,mouse_hover)
fontSetup(font_small,c_black,fa_center,fa_center,1)
if icon {
    draw_text(xx+w/2+12,yy+h/2,text)
    draw_sprite(icon,0,xx+16,yy+h/2)
}
else {
    draw_text(xx+w/2,yy+h/2,text)
}

return mouse_hover and mouse_check_button_pressed(mb_left)
