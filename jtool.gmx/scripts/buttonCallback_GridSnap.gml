var g = get_integer('Grid snap, pixels, between 1 and 32',oEdit.snap)
if g >= 1 and g <= 32 {
    oEdit.snap = g
    saveConfig()
}