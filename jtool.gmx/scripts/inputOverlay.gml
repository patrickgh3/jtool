// inputOverlay(mode,callback,label)

var mode = argument0
var callback = argument1
var label = argument2

if global.state == globalstate_input {
    show_debug_message('inputOverlay called when state was already input')
    exit
}

instance_create(0,0,oInputOverlay)
oInputOverlay.mode = mode
oInputOverlay.callback = callback
oInputOverlay.previous_state = global.state
oInputOverlay.previous_zoom = oZoom.zoom
oInputOverlay.label = label
global.state = globalstate_input
keyboard_string = ''
saveAndResetZoom()
