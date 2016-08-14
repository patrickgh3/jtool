/// addDefaultSkinSprite(str, spr)

var str = argument0
var spr = argument1

global.stringToDefaultSkinSprite[? str] = spr
ds_list_add(global.defaultSkinSpriteList, spr)
