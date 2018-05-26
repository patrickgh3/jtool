// Set the zoom to the previously saved zoom.

with oZoom {
    if not has_previous exit
    has_previous = false
    
    zoom=zoom_previous
    x1_target=x1_previous
    y1_target=y1_previous
    x2_target=x2_previous
    y2_target=y2_previous
}
