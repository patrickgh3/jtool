/// menuButton(x, y, w, h, text, enabled, icon)

// Draws a button and returns whether or not it was clicked.

var xx = argument0
var yy = argument1
var w = argument2
var h = argument3
var text = argument4
var enabled = argument5
var icon = argument6

var pressed = menuButton(argument0, argument1, argument2, argument3, argument4, argument5, argument6)
var mouse_hover = point_in_rect(mouse_x,mouse_y,xx,yy,xx+w-1,yy+h-1) and enabled
if mouse_hover {
    draw_set_font(font_small)
    var sss = 'Shift by grid snap'
    var w = string_width(sss)+10
    var xx = min(mouse_x, room_width-5-w)
    menuButton(xx, mouse_y+20, w, 25, sss, false, false)
}
return pressed
