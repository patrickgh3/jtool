if oEdit.undo_objectstring != '' {
    var prompt = 'Unsaved changes detected. Sure you want to clear the map?'
    if not show_question(prompt) exit
}

with all if object_is_edit(object_index) instance_destroy()
oEdit.undo_objectstring = ''
instance_create(352,416,oEditBlock)
instance_create(384,416,oEditBlock)
instance_create(416,416,oEditBlock)
instance_create(384,384,oPlayerStart)
global.savePlayerX = oPlayerStart.x+17
global.savePlayerY = oPlayerStart.y+23
global.savePlayerXScale = 1
loadPlayer()
