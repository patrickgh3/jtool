if not oEdit.undo_nochanges {
    inputOverlay(input_yesno,inputCallback_LoadRMJMap,
    'Unsaved changes detected.#Sure you want to import an RMJ map?')
}
else {
    global.input_bool = true
    inputCallback_LoadRMJMap()
}
