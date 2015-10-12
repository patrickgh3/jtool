// Saves the current zoom target and zooms all the way out.
// Zoom can be restored using restoreZoom().

if global.count == 0 exit

with oZoom {
    if has_previous exit
    has_previous = true
    
    x1_previous=x1_target
    y1_previous=y1_target
    x2_previous=x2_target
    y2_previous=y2_target
    zoom_previous=zoom
    zoom = 1
}
