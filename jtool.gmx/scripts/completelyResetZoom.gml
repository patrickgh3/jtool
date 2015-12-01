// Zoom out and forget about previous zoom to return to.

if global.count == 0 exit

with oZoom {
    has_previous = false
    x1_target=0
    y1_target=0
    x2_target=1056
    y2_target=608
    zoom = 1
    x1_previous=x1_target
    y1_previous=y1_target
    x2_previous=x2_target
    y2_previous=y2_target
    zoom_previous=zoom
}
