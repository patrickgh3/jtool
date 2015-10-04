if not oEdit.undo_nochanges {
    inputOverlay(input_yesno,inputCallback_LoadMap,
    'Unsaved changes detected.#Sure you want to load a map?')
}
else {
    global.input_bool = true
    inputCallback_LoadMap()
}
