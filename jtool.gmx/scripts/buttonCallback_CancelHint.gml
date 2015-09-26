var o = get_integer('Cutoff for displaying jump cancel hints, frames, between 0 and 5','')
if o >= 0 and o <= 5 {
    oDisplay.jc_cutoff = o
}