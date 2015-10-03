if oEdit.undo_objectstring != '' {
    //var prompt = 'Unsaved changes detected. Sure you want to clear the map?'
    //if not show_question(prompt) exit
    inputOverlay(input_yesno,inputCallback_ClearMap,
    'Unsaved changes detected.#Sure you want to clear the map?')
}
else {
    global.input_bool = true
    inputCallback_ClearMap()
}
