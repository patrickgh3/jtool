if not oEdit.undo_nochanges {
    inputOverlay(input_yesno,inputCallback_ClearMap,
    'Unsaved changes detected.#Sure you want to clear the map?')
}
else {
    global.input_bool = true
    inputCallback_ClearMap()
}
