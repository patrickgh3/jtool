// comboBoxButton(x,y,w,h,droph,text)

var xx = argument0
var yy = argument1
var w = argument2
var h = argument3
var droph = argument4
var text = argument5
var icon = argument6

var enabled = global.state == globalstate_idle and not global.comboboxselected
if menuButton(xx,yy,w,h,text,enabled,icon) {
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
