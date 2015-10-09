// Load the specified skin from file into the game.

var skin_name = argument0

var skinfolder = prefix_project_path_if_needed('skins\'+skin_name+'\')
var ini_filename = skinfolder+'skin_config.ini'

if not FS_file_exists(ini_filename) {
    show_message("File "+ini_filename+" doesn't exist.")
    exit
}
FS_ini_open(ini_filename)

// ui
global.color_button = colorFromHsvDelimString(
    FS_ini_read_string('ui','button_idle_color','0,0,175'),',')
global.color_buttonhover = colorFromHsvDelimString(
    FS_ini_read_string('ui','button_active_color','0,0,175'),',')
global.buttonhoveralpha = FS_ini_read_real('ui','button_active_alpha',0.5)
global.buttonhoverborder = FS_ini_read_real('ui','button_active_border',false)

// objects
var colorstring = FS_ini_read_string('objects','killer_idle_color','0,0,255')
global.color_killerhue = real(splitDelimString(colorstring,',',0))
global.color_killersat = real(splitDelimString(colorstring,',',1))
global.color_killerval = real(splitDelimString(colorstring,',',2))
global.color_killer = colorFromHsvDelimString(colorstring,',')
var colorstring = FS_ini_read_string('objects','killer_active_color','0,128,255')
global.color_killer2hue = real(splitDelimString(colorstring,',',0))
global.color_killer2sat = real(splitDelimString(colorstring,',',1))
global.color_killer2val = real(splitDelimString(colorstring,',',2))
global.color_killer2 = colorFromHsvDelimString(colorstring,',')
global.color_warp = colorFromHsvDelimString(
    FS_ini_read_string('objects','warp_color','67,196,239'),',')
global.bulletblockeralpha = FS_ini_read_real('objects','bulletblocker_alpha',0.3)
global.spikeframes = FS_ini_read_real('objects','spike_frames',1)
global.spikeanimspeed = FS_ini_read_real('objects','spike_animspeed',1)
global.minispikeframes = FS_ini_read_real('objects','minispike_frames',1)
global.minispikeanimspeed = FS_ini_read_real('objects','minispike_animspeed',1)

// bg
var bg_type = FS_ini_read_string('bg','type','stretch')
var bg_hspeed = FS_ini_read_real('bg','hspeed',0)
var bg_vspeed = FS_ini_read_real('bg','vspeed',0)
FS_ini_close()

// assign sprites from file
for (var i=0; i<100; i+=1) {
    /* spr_index - sprite index to replace
       spr_default - default sprite to use if png not found
       file - name of png file
       xo - sprite x origin to set
       yo - sprite y origin to set
       frames - number of frames the sprite png has (set below switch statement)
    */
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
        case 8:  spr_index=sEditBlock spr_default=sEditBlockDefault file='block.png' xo=0 yo=0 break
        case 9:  spr_index=sEditMiniBlock spr_default=sEditMiniBlockDefault file='miniblock.png' xo=0 yo=0 break
        case 10: spr_index=sPlatform spr_default=sPlatformDefault file='platform.png' xo=0 yo=0 break
        case 11: spr_index=sSave spr_default=sSaveDefault file='save.png' xo=0 yo=0 break
        case 12: spr_index=sApple spr_default=sAppleDefault file='apple.png' xo=10 yo=12 break
        case 13: spr_index=sWater1 spr_default=sWater1Default file='water1.png' xo=0 yo=0 break
        case 14: spr_index=sWater2 spr_default=sWater2Default file='water2.png' xo=0 yo=0 break
        case 15: spr_index=sWalljumpL spr_default=sWalljumpLDefault file='walljumpL.png' xo=0 yo=0 break
        case 16: spr_index=sWalljumpR spr_default=sWalljumpRDefault file='walljumpR.png' xo=0 yo=0 break
        case 17: spr_index=sKillerBlock spr_default=sKillerBlockDefault file='killerblock.png' xo=0 yo=0 break
        case 18: spr_index=sSidebar spr_default=sSidebarDefault file='sidebar.png' xo=0 yo=0 break
        case 19: spr_index=sMenu spr_default=sMenuDefault file='menu.png' xo=0 yo=0 break
        case 20: spr_index=sBulletBlocker spr_default=sBulletBlockerDefault file='bulletblocker.png' xo=0 yo=0 break
        case 21: spr_index=sPlayerStart spr_default=sPlayerStartDefault file='playerstart.png' xo=0 yo=0 break
        case 22: spr_index=sWarp spr_default=sWarpDefault file='warp.png' xo=0 yo=0 break
        case 23: spr_index=sJumpRefresher spr_default=sJumpRefresherDefault file='jumprefresher.png' xo=15 yo=15 break
        case 24: spr_index=sWater3 spr_default=sWater3Default file='water3.png' xo=0 yo=0 break
        default: continue
    }
    
    if spr_index == sSpikeUp or spr_index == sSpikeRight or spr_index == sSpikeLeft or spr_index == sSpikeDown {
        frames = global.spikeframes
    }
    else if spr_index == sMiniSpikeUp or spr_index == sMiniSpikeRight or spr_index == sMiniSpikeLeft or spr_index == sMiniSpikeDown {
        frames = global.minispikeframes
    }
    else if spr_index == sApple or spr_index == sSave {
        frames = 2
    }
    else {
        frames = 1
    }
    
    if FS_file_exists(skinfolder+file) {
        var spr = FS_sprite_add(skinfolder+file,frames,false,false,xo,yo)
        if spr != -1 {
            sprite_assign(spr_index,spr)
            sprite_delete(spr)
        }
        else {
            show_message("Error when adding sprite "+skinfolder+file
                +". Try double checking everything.")
            sprite_assign(spr_index,spr_default)
        }
    }
    else {
        sprite_assign(spr_index,spr_default)
    }
}

// assign background from file
if FS_file_exists(skinfolder+'bg.png') {
    var bg = FS_background_add(skinfolder+'bg.png',false,false)
    if bg != -1 {
        background_assign(bgBackground,bg)
        background_delete(bg)
    }
    else {
        show_message("Error when adding background "+skinfolder+file
            +". Try double checking everything.")
        background_assign(bgBackground,bgBackgroundDefault)
    }
}
else {
    background_assign(bgBackground,bgBackgroundDefault)
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
