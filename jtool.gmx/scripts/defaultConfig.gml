global.key_left = vk_left
global.key_right = vk_right
global.key_up = vk_up
global.key_down = vk_down
global.key_jump = vk_shift
global.key_shoot = ord('Z')
global.key_restart = ord('R')
global.key_suicide = ord('Q')
global.key_pause = vk_escape

global.muteMusic = false
global.volumeLevel = 100
audio_master_gain(global.volumeLevel/100)

window_set_fullscreen(false)
oWorld.alarm[0] = 1