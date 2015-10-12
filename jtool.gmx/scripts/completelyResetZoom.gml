// Zoom out and forget about previous zoom to return to.

if global.count == 0 exit

with oZoom {
    has_previous = false
    x1_target=0
    y1_previous=0
    x2_previous=1056
    y2_previous=608
    zoom = 1
}
saveAndResetZoom()
