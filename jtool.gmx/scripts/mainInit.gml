/// mainInit()
// Main init script that should be called once upon game start.

// Initialize global constants and other misc init stuff.
randomize()
display_set_gui_size(view_wport, view_hport)
window_set_caption('jtool')
DerpXml_Init()
global.key_left = vk_left
global.key_right = vk_right
global.key_up = vk_up
global.key_down = vk_down
global.key_jump = vk_shift
global.key_shoot = ord('Z')
global.key_restart = ord('R')
global.key_suicide = ord('Q')
global.key_pause = vk_escape
global.version_major = 1
global.version_minor = 2
global.version_patch = 2
global.version_string = string(global.version_major)+'.'+string(global.version_minor)+'.'+string(global.version_patch)

// Initialze global state. (bad patrick, bad)
global.state = globalstate_idle
global.comboboxselected = false
global.count = 0
global.frameaction_jump = false
global.frameaction_djump = false
global.frameaction_jumpslow = false
global.player_xscale = 1 // Todo: move this variable to the player object
global.joketitleindex = 0
global.input_string = ''
global.input_bool = false
global.input_cancel = false
global.depthList = ds_list_create()
global.waterlocked = false
global.lastMapNameOkayToQuickSave = false
global.killer_holdduration = 12 // Todo: load from config?
global.killer_fadeduration = 4

// Initialize pairings of object indexes and strings in xml files.
global.objectToStringMap = ds_map_create()
global.stringToObjectMap = ds_map_create()
addObjectStringPairing(oKiller, 'killer')
addObjectStringPairing(oBlock, 'block')
addObjectStringPairing(oSave, 'save')
addObjectStringPairing(oSaveFlipped, 'saveFlipped')
addObjectStringPairing(oPlatform, 'platform')
addObjectStringPairing(oWater1, 'water1')
addObjectStringPairing(oWater2, 'water2')
addObjectStringPairing(oWater3, 'water3')
addObjectStringPairing(oWalljumpL, 'walljumpL')
addObjectStringPairing(oWalljumpR, 'walljumpR')
addObjectStringPairing(oJumpRefresher, 'jumpRefresher')
addObjectStringPairing(oBulletBlocker, 'bulletBlocker')
addObjectStringPairing(oPlayerStart, 'playerStart')
addObjectStringPairing(oWarp, 'warp')
addObjectStringPairing(oGravityArrowUp, 'gravityUp')
addObjectStringPairing(oGravityArrowDown, 'gravityDown')

// Initialize pairings of default sprite indexes and strings in xml files.
global.defaultSkinSpriteList = ds_list_create()
global.stringToDefaultSkinSprite = ds_map_create()
addDefaultSkinSprite('block', sEditBlockDefault)
addDefaultSkinSprite('miniblock', sEditMiniBlockDefault)
addDefaultSkinSprite('spikeup', sSpikeUpDefault)
addDefaultSkinSprite('spikeright', sSpikeRightDefault)
addDefaultSkinSprite('spikeleft', sSpikeLeftDefault)
addDefaultSkinSprite('spikedown', sSpikeDownDefault)
addDefaultSkinSprite('miniup', sMiniSpikeUpDefault)
addDefaultSkinSprite('miniright', sMiniSpikeRightDefault)
addDefaultSkinSprite('minileft', sMiniSpikeLeftDefault)
addDefaultSkinSprite('minidown', sMiniSpikeDownDefault)
addDefaultSkinSprite('apple', sAppleDefault)
addDefaultSkinSprite('save', sSaveDefault)
addDefaultSkinSprite('platform', sPlatformDefault)
addDefaultSkinSprite('water1', sWater1Default)
addDefaultSkinSprite('water2', sWater2Default)
addDefaultSkinSprite('water3', sWater3Default)
addDefaultSkinSprite('killerblock', sKillerBlockDefault)
addDefaultSkinSprite('walljumpL', sWalljumpLDefault)
addDefaultSkinSprite('walljumpR', sWalljumpRDefault)
addDefaultSkinSprite('bulletblocker', sBulletBlockerDefault)
addDefaultSkinSprite('playerstart', sPlayerStartDefault)
addDefaultSkinSprite('warp', sWarpDefault)
addDefaultSkinSprite('jumprefresher', sJumpRefresherDefault)
addDefaultSkinSprite('gravityup', sGravityUpDefault)
addDefaultSkinSprite('gravitydown', sGravityDownDefault)
addDefaultSkinSprite('saveflipped', sSaveFlippedDefault)

// Initialize palatte data structures and do an initial palatte load.
global.skinSpriteMap = ds_map_create()
global.palatteList = ds_list_create()
loadPalatteConfig()

// Load config from file.
loadConfig()

// Load the startup map.
loadStartupMap()

// Send version check request.
versionRequestId = http_get('http://cwpat.me/jtool-version')

