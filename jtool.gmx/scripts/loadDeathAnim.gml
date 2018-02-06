// Load the specified death animation from file into the game.

var deathanim_name = argument0

var deathanim_folder = prefix_project_path_if_needed('deaths\'+deathanim_name+'\')
var ini_filename = deathanim_folder+'death_config.ini'
var missing_ini_filename = prefix_project_path_if_needed('death_config_missing.ini')

if not directory_exists(deathanim_folder) {
    inputOverlay(input_info,false,"Couldn't find death animations folder#"+skinfolder)
    ini_filename = missing_ini_filename
}
else if not file_exists(ini_filename) {
    inputOverlay(input_info,false,'Warning: '+ini_filename+' does not exist.')
}
ini_open(ini_filename)

// meta
var skinver_string = ini_read_string('meta','version','')
if skinver_string == '' {
    //inputOverlay(input_info,false,'Warning: no version provided in skin.')
}
else {
    var skinver_major = real(splitDelimString(skinver_string,'.',0))
    if skinver_major > global.version_major {
        //inputOverlay(input_info,false,'Warning: may not be not compatible with skin;#it has a new major version.')
    }
}

// death sound
file_copy(deathanim_folder+"death.ogg", working_directory+'death.ogg');
global.DeathAudio = audio_create_stream(working_directory+"death.ogg");

// blood
var bfname = ini_read_string('blood', 'filename', 'blood_sprite3.png');
file_copy(deathanim_folder+bfname, working_directory+'blood_sprite.png');
bfname = working_directory+'blood_sprite.png'
var bimgnum = ini_read_real('blood', 'imgnum', 1);
var bremoveback = ini_read_real('blood', 'removeback', 0);
var bsmooth = ini_read_real('blood', 'smooth', 0);
var bxorig = ini_read_real('blood', 'xorig',  2);
var byorig = ini_read_real('blood', 'yorig',  2);
global.bloodSprite = sprite_replace(sPlayerBlood, bfname, bimgnum, bremoveback, bsmooth, bxorig, byorig);

// charm1
var cfname1 = ini_read_string('charm1', 'filename', 'charm1.png');
file_copy(deathanim_folder+cfname1, working_directory+'charm1_sprite.png');
cfname1 = working_directory+'charm1_sprite.png'
var cimgnum1 = ini_read_real('charm1', 'imgnum', 1);
var cremoveback1 = ini_read_real('charm1', 'removeback', 0);
var csmooth1 = ini_read_real('charm1', 'smooth', 0);
var cxorig1 = ini_read_real('charm1', 'xorig',  2);
var cyorig1 = ini_read_real('charm1', 'yorig',  2);
global.charm1Sprite = sprite_add(cfname1, cimgnum1, cremoveback1, csmooth1, cxorig1, cyorig1);

// scripts
var emit_create = file_text_open_read(deathanim_folder+'emitter_create.gml');
global.ScrEmitterCreate = "";
do
{
    var adder = file_text_read_string(emit_create);
    global.ScrEmitterCreate += adder
}
until (adder == "");
global.ScrEmitterCreate = string_remove_whitespace(global.ScrEmitterCreate);
global.ScrEmitterCreate = NSP_save(global.ScrEmitterCreate);

var emit_step = file_text_open_read(deathanim_folder+'emitter_step.gml');
global.ScrEmitterStep = "";
do
{
    var adder = file_text_read_string(emit_step);
    global.ScrEmitterStep += adder
}
until (adder == "");
global.ScrEmitterStep = string_remove_whitespace(global.ScrEmitterStep);
global.ScrEmitterStep = NSP_save(global.ScrEmitterStep);

var blood_create = file_text_open_read(deathanim_folder+'blood_create.gml');
global.ScrBloodCreate = "";
do
{
    var adder = file_text_read_string(blood_create);
    global.ScrBloodCreate += adder
}
until (adder == "");
global.ScrBloodCreate = string_remove_whitespace(global.ScrBloodCreate);
global.ScrBloodCreate = NSP_save(global.ScrBloodCreate);

var blood_step = file_text_open_read(deathanim_folder+'blood_step.gml');
global.ScrBloodStep = "";
do
{
    var adder = file_text_read_string(blood_step);
    global.ScrBloodStep += adder
}
until (adder == "");
global.ScrBloodStep = string_remove_whitespace(global.ScrBloodStep);
global.ScrBloodStep = NSP_save(global.ScrBloodStep);

var blood_platform = file_text_open_read(deathanim_folder+'blood_platform.gml');
global.ScrBloodPlatform = "";
do
{
    var adder = file_text_read_string(blood_platform);
    global.ScrBloodPlatform += adder
}
until (adder == "");
global.ScrBloodPlatform = string_remove_whitespace(global.ScrBloodPlatform);
global.ScrBloodPlatform = NSP_save(global.ScrBloodPlatform);

var blood_block = file_text_open_read(deathanim_folder+'blood_block.gml');
global.ScrBloodBlock = "";
do
{
    var adder = file_text_read_string(blood_block);
    global.ScrBloodBlock += adder
}
until (adder == "");
global.ScrBloodBlock = string_remove_whitespace(global.ScrBloodBlock);
global.ScrBloodBlock = NSP_save(global.ScrBloodBlock);

var blood_animation_end = file_text_open_read(deathanim_folder+'blood_animation_end.gml');
global.ScrBloodAnimationEnd = "";
do
{
    var adder = file_text_read_string(blood_animation_end);
    global.ScrBloodAnimationEnd += adder
}
until (adder == "");
global.ScrBloodAnimationEnd = string_remove_whitespace(global.ScrBloodAnimationEnd);
global.ScrBloodAnimationEnd = NSP_save(global.ScrBloodAnimationEnd);

var blood_animation_end = file_text_open_read(deathanim_folder+'blood_animation_end.gml');
global.ScrBloodAnimationEnd = "";
do
{
    var adder = file_text_read_string(blood_animation_end);
    global.ScrBloodAnimationEnd += adder
}
until (adder == "");
global.ScrBloodAnimationEnd = string_remove_whitespace(global.ScrBloodAnimationEnd);
global.ScrBloodAnimationEnd = NSP_save(global.ScrBloodAnimationEnd);

var charm1_create = file_text_open_read(deathanim_folder+'charm1_create.gml');
global.ScrCharm1Create = "";
do
{
    var adder = file_text_read_string(charm1_create);
    global.ScrCharm1Create += adder
}
until (adder == "");
global.ScrCharm1Create = string_remove_whitespace(global.ScrCharm1Create);
global.ScrCharm1Create = NSP_save(global.ScrCharm1Create);

var charm1_step = file_text_open_read(deathanim_folder+'charm1_step.gml');
global.ScrCharm1Step = "";
do
{
    var adder = file_text_read_string(charm1_step);
    global.ScrCharm1Step += adder
}
until (adder == "");
global.ScrCharm1Step = string_remove_whitespace(global.ScrCharm1Step);
global.ScrCharm1Step = NSP_save(global.ScrCharm1Step);

var charm1_alarm0 = file_text_open_read(deathanim_folder+'charm1_alarm0.gml');
global.ScrCharm1Alarm0 = "";
do
{
    var adder = file_text_read_string(charm1_alarm0);
    global.ScrCharm1Alarm0 += adder
}
until (adder == "");
global.ScrCharm1Alarm0 = string_remove_whitespace(global.ScrCharm1Alarm0);
global.ScrCharm1Alarm0 = NSP_save(global.ScrCharm1Alarm0);
