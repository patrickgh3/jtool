var g = get_integer('Grid snap, pixels, between 1 and 32','')
if g >= 1 and g <= 32 {
    oEdit.snap = g
    saveConfig()
}
