// Main init script that should be called once upon game start.

/* tell if we're running from the editor or from the compiled game,
   since that function isn't built into gm.
   the editor directory is similar to this:
   C:\Users\User\AppData\Local\Temp\gm_ttt_881\gm_ttt_30167\
   this assumes the user doesn't have their own folder containing "gm_ttt",
   but I think that's a safe assumption.
*/
global.run_from_editor = string_pos('gm_ttt',working_directory) != 0
global.editor_project_path = 'C:\Users\Starz0r\Desktop\jtool'
// add backslash to end
if string_char_at(global.editor_project_path,string_length(global.editor_project_path)) != '\' {
    global.editor_project_path += '\'
}
if global.run_from_editor and not directory_exists(global.editor_project_path) {
    show_message("The editor project path you specified doesnt exist!#Edit the variable in the misc/mainInit script.")
    game_end()
}

window_command_hook(window_command_close);

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
global.version_minor = 4
global.version_patch = 0
global.version_string = string(global.version_major)+'.'+string(global.version_minor)+'.'+string(global.version_patch)
global.input_string = ''
global.input_bool = false
global.input_cancel = false
global.depthList = ds_list_create()
global.waterlocked = false
global.backup_period = 5*60*50
alarm[5] = global.backup_period
global.shouldresetloadedmapname = false

// maybe later load from map
global.grav = 1
global.saveGrav = 1

// might load from config later
global.killer_holdduration = 12
global.killer_fadeduration = 4
global.restartWithDJump = true;
global.checkNudgeEarly = true;

NSP_initialize();
loadConfig()

var backupFilename = prefix_project_path_if_needed('backup.jmap')
if file_exists(backupFilename) {
    loadMap(backupFilename)
    inputOverlay(input_info,false,'Jtool did not exit successfully.#Backup map has been loaded.')
}
else {
    loadStartupMap()
    if global.checkupdates {
        versionRequestId = http_get('http://cwpat.me/jtool-version')
    }
}

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
