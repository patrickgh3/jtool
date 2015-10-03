// Load the specified skin from file into the game.

var skin_name = argument0
var folder = 'skins\'+skin_name+'\'

var ini_filename = folder+skin_name+'.ini'
if not file_exists(ini_filename) {
    show_message("File "+ini_filename+" doesn't exist.")
    exit
}

ini_open(ini_filename)

// ui
global.color_button = colorFromHsvDelimString(
    ini_read_string('ui','button_idle_color','0,0,175'),',')
global.color_buttonhover = colorFromHsvDelimString(
    ini_read_string('ui','button_active_color','0,0,175'),',')
global.buttonhoveralpha = ini_read_real('ui','button_active_alpha',0.5)
global.buttonhoverborder = ini_read_real('ui','button_active_border',false)

// objects
var colorstring = ini_read_string('objects','killer_idle_color','0,0,255')
global.color_killerhue = real(string_split(colorstring,0,','))
global.color_killersat = real(string_split(colorstring,1,','))
global.color_killerval = real(string_split(colorstring,2,','))
global.color_killer = colorFromHsvDelimString(colorstring,',')
var colorstring = ini_read_string('objects','killer_active_color','0,128,255')
global.color_killer2hue = real(string_split(colorstring,0,','))
global.color_killer2sat = real(string_split(colorstring,1,','))
global.color_killer2val = real(string_split(colorstring,2,','))
global.color_killer2 = colorFromHsvDelimString(colorstring,',')
global.color_warp = colorFromHsvDelimString(
    ini_read_string('objects','warp_color','67,196,239'),',')
global.bulletblockeralpha = ini_read_real('objects','bulletblocker_alpha',0.3)
global.spikeframes = ini_read_real('objects','spike_frames',1)
global.spikeanimspeed = ini_read_real('objects','spike_animspeed',1)
global.minispikeframes = ini_read_real('objects','minispike_frames',1)
global.minispikeanimspeed = ini_read_real('objects','minispike_animspeed',1)

// bg
var bg_type = ini_read_string('bg','type','stretch')
var bg_hspeed = ini_read_real('bg','hspeed',0)
var bg_vspeed = ini_read_real('bg','vspeed',0)

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
        case 10: spr_index=sPlatform spr_default=sPlatformDefault file='platform.png' xo=0 yo=0 frames=1 break
        case 11: spr_index=sSave spr_default=sSaveDefault file='save.png' xo=0 yo=0 frames=2 break
        case 12: spr_index=sApple spr_default=sAppleDefault file='apple.png' xo=10 yo=12 frames=2 break
        case 13: spr_index=sWater1 spr_default=sWater1Default file='water1.png' xo=0 yo=0 frames=1 break
        case 14: spr_index=sWater2 spr_default=sWater2Default file='water2.png' xo=0 yo=0 frames=1 break
        case 15: spr_index=sWalljumpL spr_default=sWalljumpLDefault file='walljumpL.png' xo=0 yo=0 frames=1 break
        case 16: spr_index=sWalljumpR spr_default=sWalljumpRDefault file='walljumpR.png' xo=0 yo=0 frames=1 break
        case 17: spr_index=sKillerBlock spr_default=sKillerBlockDefault file='killerblock.png' xo=0 yo=0 frames=1 break
        case 18: spr_index=sSidebar spr_default=sSidebarDefault file='sidebar.png' xo=0 yo=0 frames=1 break
        case 19: spr_index=sMenu spr_default=sMenuDefault file='menu.png' xo=0 yo=0 frames=1 break
        case 20: spr_index=sBulletBlocker spr_default=sBulletBlockerDefault file='bulletblocker.png' xo=0 yo=0 frames=1 break
        case 21: spr_index=sPlayerStart spr_default=sPlayerStartDefault file='playerstart.png' xo=0 yo=0 frames=1 break
        case 22: spr_index=sWarp spr_default=sWarpDefault file='warp.png' xo=0 yo=0 frames=1 break
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
