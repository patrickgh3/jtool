/// Main init script that should be called once upon game start.

// global state
global.state = globalstate_idle
global.comboboxselected = false
global.count = 0
global.frameaction_jump = false
global.frameaction_djump = false
global.frameaction_jumpslow = false
global.player_xscale = 1
global.joketitleindex = 0 // used in buttonCallback_JokeTitle

/* tell if we're running from the editor or from the compiled game,
   since that function isn't built into gm.
   the editor directory is similar to this:
   C:\Users\User\AppData\Local\Temp\gm_ttt_881\gm_ttt_30167\
   this assumes the user doesn't have their own folder containing "gm_ttt",
   but I think that's a safe assumption.
*/
global.run_from_editor = string_pos('gm_ttt',working_directory) != 0
global.editor_project_path = 'C:\Users\Traynor Traynor\Documents\GameMaker\jtool\'

loadConfig()

// might load from config
global.killer_holdduration = 12
global.killer_fadeduration = 4

// set by map in future?
global.savePlayerX = 100
global.savePlayerY = 100
global.saveGrav = 1
global.savePlayerXScale = 1
global.grav = 1

// might eliminate when doing default map load on startup
global.infinitejump = false
global.dotkid = false
global.firstRoomStart = true // uh, yeah. uh

// misc
randomize()
display_set_gui_size(view_wview[0],view_hview[0])
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
/*global.muteMusic = false
global.volumeLevel = 100
audio_master_gain(global.volumeLevel/100)*/
