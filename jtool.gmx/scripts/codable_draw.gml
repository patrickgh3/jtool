///codable_draw(draw_self)
//This must be placed in the draw event of any codable objects.
//Draws an orange overlay on any object that has code while alt is held
//set draw_self to true to draw self, false to only draw overlay

if argument0 draw_self()

if keyboard_check_direct(vk_alt) and code_step_written != '' {
    // if there is code written but none compiled, then this is probably an error condition
    // display red to indicate
    if (code_step_written != '' and code_step_compiled == 0) {
        shader_set(shdSingleColor)
        draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_red,0.5)
        shader_reset()
    }
    // if there is code written and compiled, we're good
    // display orange to indicate
    else if (code_step_written != '' and code_step_compiled != 0) {
        shader_set(shdSingleColor)
        draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_orange,0.5)
        shader_reset()
    }
}
