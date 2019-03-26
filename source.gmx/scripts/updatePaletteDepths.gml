var objectList = ds_list_create()
for (var i=0; i<ds_list_size(global.depthList); i++) {
    var newdepth;
    switch i {
        case 0: newdepth = -10 break
        case 1: newdepth = -5 break
        case 2: newdepth = 5 break
        case 3: newdepth = 10 break
    }
    ds_list_clear(objectList)
    switch ds_list_find_value(global.depthList, i) {
        case depthorder_block:
           ds_list_add(objectList, oEditBlock)
           ds_list_add(objectList, oEditMiniBlock)
           ds_list_add(objectList, oPlatform)
           break
        case depthorder_spike:
           ds_list_add(objectList, oSpikeUp)
           ds_list_add(objectList, oSpikeRight)
           ds_list_add(objectList, oSpikeLeft)
           ds_list_add(objectList, oSpikeDown)
           ds_list_add(objectList, oMiniSpikeUp)
           ds_list_add(objectList, oMiniSpikeRight)
           ds_list_add(objectList, oMiniSpikeLeft)
           ds_list_add(objectList, oMiniSpikeDown)
           ds_list_add(objectList, oApple)
           ds_list_add(objectList, oKillerBlock)
           ds_list_add(objectList, oMiniKillerBlock)
           break
        case depthorder_water:
           ds_list_add(objectList, oWater)
           ds_list_add(objectList, oWater2)
           ds_list_add(objectList, oWater3)
           break
        case depthorder_player:
           ds_list_add(objectList, oPlayer)
           ds_list_add(objectList, oBulletBlocker)
           ds_list_add(objectList, oSave)
           ds_list_add(objectList, oWarp)
           ds_list_add(objectList, oJumpRefresher)
           ds_list_add(objectList, oPlayerStart)
           break
    }
    for (var j=0; j<ds_list_size(objectList); j++) {
        var obj = ds_list_find_value(objectList, j)
        with obj depth = newdepth
        object_set_depth(obj, newdepth)
    }
}
ds_list_destroy(objectList)

// set vines to be just above blocks
var newdepth = object_get_depth(oEditBlock)-1
with oWalljumpL depth = newdepth
object_set_depth(oWalljumpL, newdepth)
with oWalljumpR depth = newdepth
object_set_depth(oWalljumpR, newdepth)

// set player to be just above siblings
object_set_depth(oPlayer, object_get_depth(oPlayer)-1)
with oPlayer depth -= 1

// set grid to be just behind player siblings
oDrawGrid.depth = object_get_depth(oPlayer)+2
