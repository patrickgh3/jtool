var count = argument0

var fraction = 1-(count-global.killer_holdduration)/global.killer_fadeduration
return clamp(fraction,0,1)
