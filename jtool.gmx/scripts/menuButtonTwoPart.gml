/// menuButtonTwoPart(x, y, w, h, text, enabled, icon)

// Draws a button and returns 1 if clicked on left, 2 if clicked on right, 0 if not clicked

var xx = argument0
var yy = argument1
var w = argument2
var h = argument3
var text = argument4
var enabled = argument5
var icon = argument6

var mouse_hover1 = point_in_rect(mouse_x,mouse_y,xx,yy,xx+w/2-1,yy+h-1) and enabled
var mouse_hover2 = point_in_rect(mouse_x,mouse_y,xx+w/2,yy,xx+w-1,yy+h-1) and enabled

drawButton(xx,yy,w,h,false)

draw_set_alpha(global.buttonhoveralpha)
draw_set_color(global.color_buttonhover)
if mouse_hover1 draw_rectangle(xx,yy,xx+w/2-1,yy+h-1,false)
if mouse_hover2 draw_rectangle(xx+w/2,yy,xx+w-1,yy+h-1,false)
if global.buttonhoverborder {
    draw_set_alpha(0.3)
    draw_set_color(c_black)
    if mouse_hover1 draw_rectangle(xx-1,yy-1,xx+w/2,yy+h,true)
    if mouse_hover2 draw_rectangle(xx+w/2,yy-1,xx+w,yy+h,true)
}
draw_set_alpha(1)
draw_set_color(c_black)
draw_rectangle(xx,yy,xx+w-1,yy+h-1,true)

fontSetup(font_small,c_black,fa_center,fa_center,1)
if icon {
    draw_text(xx+w/2+12,yy+h/2,text)
    draw_sprite(icon,0,xx+16,yy+h/2)
}
else {
    draw_text(xx+w/2,yy+h/2,text)
}

if mouse_hover1 and mouse_check_button_pressed(mb_left)
    return 1
if mouse_hover2 and mouse_check_button_pressed(mb_left)
    return 2
return 0
