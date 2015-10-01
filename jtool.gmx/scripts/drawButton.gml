// Draws a button

// drawButton(x,y,w,h,active)

var xx = argument0
var yy = argument1
var w = argument2
var h = argument3
var active = argument4

draw_set_alpha(1)
draw_set_color(global.color_button)
draw_rectangle(xx,yy,xx+w-1,yy+h-1,false)

if active {
    draw_set_alpha(global.color_buttonhoveralpha)
    draw_set_color(global.color_buttonhover)
    draw_rectangle(xx,yy,xx+w-1,yy+h-1,false)
    if global.buttonhoverborder {
        draw_set_alpha(0.3)
        draw_set_color(c_black)
        draw_rectangle(xx-1,yy-1,xx+w,yy+h,true)
    }
}

draw_set_alpha(1)
draw_set_color(c_black)
draw_rectangle(xx,yy,xx+w-1,yy+h-1,true)
