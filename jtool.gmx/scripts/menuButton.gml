// Draws and performs the action of a button.

// menuButton(x,y,w,h,text,hotkey,callback,click_enabled,hotkey_enabled)

var xx = argument0
var yy = argument1
var w = argument2
var h = argument3
var text = argument4
var hotkey = argument5
var callback = argument6
var click_enabled = argument7
var hotkey_enabled = argument8

var mouse_hover = point_in_rect(mouse_x,mouse_y,xx,yy,xx+w,yy+h)
drawButton(xx,yy,w,h,mouse_hover)
fontSetup(font_small,c_black,fa_left,fa_top,1)
draw_text(xx+5,yy+5,text)
var clicked = mouse_hover and mouse_check_button_pressed(mb_left)
var hotkey_pressed = hotkey != 0 and keyboard_check_pressed(hotkey)
if (clicked and click_enabled) or hotkey_pressed {
    script_execute(callback)
}
