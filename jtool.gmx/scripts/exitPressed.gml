if not oEdit.undo_nochanges {
    if (show_question('The map has unsaved changes.#Are you sure you want to exit?')) {
        game_end()
    }
}
else {
    game_end()
}
