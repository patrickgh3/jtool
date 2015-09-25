// Load the specified skin from file into the game.

var skin_name = argument0
var folder = 'skins\'+skin_name+'\'

var ini_filename = folder+skin_name+'.ini'
if not file_exists(ini_filename) {
    show_message("File "+ini_filename+" doesn't exist.")
    exit
}

ini_open(ini_filename)
global.color_killerhue = ini_read_real('config','killerhue',0)
global.color_killersat = ini_read_real('config','killersat',0)
global.color_killerval = ini_read_real('config','killerval',0)
global.color_killer2hue = ini_read_real('config','killer2hue',0)
global.color_killer2sat = ini_read_real('config','killer2sat',0)
global.color_killer2val = ini_read_real('config','killer2val',0)
global.color_killer = make_color_hsv(global.color_killerhue,global.color_killersat,global.color_killerval)
global.color_killer2 = make_color_hsv(global.color_killer2hue,global.color_killer2sat,global.color_killer2val)
global.spikeframes = ini_read_real('config','spikeframes',1)
global.spikeanimspeed = ini_read_real('config','spikeanimspeed',1)
global.minispikeframes = ini_read_real('config','minispikeframes',1)
global.minispikeanimspeed = ini_read_real('config','minispikeanimspeed',1)
var bg_type = ini_read_string('config','bg_type','stretch')
var bg_hspeed = ini_read_real('config','bg_hspeed',0)
var bg_vspeed = ini_read_real('config','bg_vspeed',0)
ini_close()

for (var i=0; i<30; i+=1) {
    var spr_index,spr_default,file,xo,yo,frames
    switch i {
        case 0:  spr_index=sSpikeUp spr_default=sSpikeUpDefault file='spikeup.png' xo=0 yo=0 break
        case 1:  spr_index=sSpikeRight spr_default=sSpikeRightDefault file='spikeright.png' xo=0 yo=0 break
        case 2:  spr_index=sSpikeLeft spr_default=sSpikeLeftDefault file='spikeleft.png' xo=0 yo=0 break
        case 3:  spr_index=sSpikeDown spr_default=sSpikeDownDefault file='spikedown.png' xo=0 yo=0 break
        case 4:  spr_index=sMiniSpikeUp spr_default=sMiniSpikeUpDefault file='miniup.png' xo=0 yo=0 break
        case 5:  spr_index=sMiniSpikeRight spr_default=sMiniSpikeRightDefault file='miniright.png' xo=0 yo=0 break
        case 6:  spr_index=sMiniSpikeLeft spr_default=sMiniSpikeLeftDefault file='minileft.png' xo=0 yo=0 break
        case 7:  spr_index=sMiniSpikeDown spr_default=sMiniSpikeDownDefault file='minidown.png' xo=0 yo=0 break
        case 8:  spr_index=sEditBlock spr_default=sEditBlockDefault file='block.png' xo=0 yo=0 frames=1 break
        case 9:  spr_index=sEditMiniBlock spr_default=sEditMiniBlockDefault file='miniblock.png' xo=0 yo=0 frames=1 break
        case 10: spr_index=sWater2 spr_default=sWater2Default file='water2.png' xo=0 yo=0 frames=1 break
        case 11: spr_index=sPlatform spr_default=sPlatformDefault file='platform.png' xo=0 yo=0 frames=1 break
        case 12: spr_index=sSave spr_default=sSaveDefault file='save.png' xo=0 yo=0 frames=2 break
        case 13: spr_index=sApple spr_default=sAppleDefault file='apple.png' xo=10 yo=12 frames=2 break
        case 14: spr_index=sWater1 spr_default=sWater1Default file='water1.png' xo=0 yo=0 frames=1 break
        case 15: spr_index=sWater2 spr_default=sWater2Default file='water2.png' xo=0 yo=0 frames=1 break
        case 16: spr_index=sWalljumpL spr_default=sWalljumpLDefault file='walljumpL.png' xo=0 yo=0 frames=1 break
        case 17: spr_index=sWalljumpR spr_default=sWalljumpRDefault file='walljumpR.png' xo=0 yo=0 frames=1 break
        case 18: spr_index=sKillerBlock spr_default=sKillerBlockDefault file='killerblock.png' xo=0 yo=0 frames=1 break
        default: continue
    }
    
    if spr_index == sSpikeUp or spr_index == sSpikeRight or spr_index == sSpikeLeft or spr_index == sSpikeDown {
        frames = global.spikeframes
    }
    if spr_index == sMiniSpikeUp or spr_index == sMiniSpikeRight or spr_index == sMiniSpikeLeft or spr_index == sMiniSpikeDown {
        frames = global.minispikeframes
    }
    
    if not file_exists(folder+file) {
        sprite_assign(spr_index,spr_default)
    }
    else {
        var spr = sprite_add(folder+file,frames,false,false,xo,yo)
        if spr == -1 {
            show_message("Error when adding sprite "+folder+file+". Try double checking everything.")
            sprite_assign(spr_index,spr_default)
        }
        else {
            sprite_assign(spr_index,spr)
            sprite_delete(spr)
        }
    }
}

if not file_exists(folder+'bg.png') {
    background_assign(bgBackground,bgBackgroundDefault)
}
else {
    var bg = background_add(folder+'bg.png',false,false)
    if bg == -1 {
        show_message("Error when adding sprite "+folder+file+". Try double checking everything.")
        background_assign(bgBackground,bgBackgroundDefault)
    }
    else {
        background_assign(bgBackground,bg)
        background_delete(bg)
    }
}
if bg_type == 'stretch' {
    background_xscale = room_width/background_width
    background_yscale = room_height/background_height
    background_htiled = false
    background_vtiled = false
}
else if bg_type == 'tile' {
    background_xscale = 1
    background_yscale = 1
    background_htiled = true
    background_vtiled = true
}
background_hspeed = bg_hspeed
background_vspeed = bg_vspeed
background_x = 0
background_y = 0
