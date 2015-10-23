// Main init script that should be called once upon game start.

// global state
global.state = globalstate_idle
global.comboboxselected = false
global.count = 0
global.frameaction_jump = false
global.frameaction_djump = false
global.frameaction_jumpslow = false
global.player_xscale = 1 // setting the player's xscale causes physics issues
global.joketitleindex = 0 // used in buttonCallback_JokeTitle
global.version_major = 1
global.version_minor = 0
global.version_patch = 5
global.version_string = string(global.version_major)+'.'+string(global.version_minor)+'.'+string(global.version_patch)

// maybe later load from map
global.grav = 1
global.saveGrav = 1

/* tell if we're running from the editor or from the compiled game,
   since that function isn't built into gm.
   the editor directory is similar to this:
   C:\Users\User\AppData\Local\Temp\gm_ttt_881\gm_ttt_30167\
   this assumes the user doesn't have their own folder containing "gm_ttt",
   but I think that's a safe assumption.
*/
global.run_from_editor = string_pos('gm_ttt',working_directory) != 0
global.editor_project_path = 'C:\Users\Traynor Traynor\Documents\GameMaker\jtool\'

// might load from config later
global.killer_holdduration = 12
global.killer_fadeduration = 4

loadConfig()

loadStartupMap()

// misc
randomize()
display_set_gui_size(view_wport,view_hport)
window_set_caption('jtool')
// load keys from file sometime? idk
global.key_left = vk_left
global.key_right = vk_right
global.key_up = vk_up
global.key_down = vk_down
global.key_jump = vk_shift
global.key_shoot = ord('Z')
global.key_restart = ord('R')
global.key_suicide = ord('Q')
global.key_pause = vk_escape
