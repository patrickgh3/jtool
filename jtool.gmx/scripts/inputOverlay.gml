// inputOverlay(callback,label)

var callback = argument0
var label = argument1

if global.state == globalstate_input {
    show_message('inputOverlay called when state was already input')
    exit
}
instance_create(0,0,oInputOverlay)
oInputOverlay.callback = callback
oInputOverlay.previous_state = global.state
oInputOverlay.label = label
global.state = globalstate_input
