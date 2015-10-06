/* Creates an object from a map serialized string.
   See mapSerializeObject for the format of the string.
   
   If the object palette id wasn't recognized, no object
   will be created and the script returns the constant noone.
   Otherwise returns the index of the created object.
*/

var str = argument0

var paletteid = base32StringToInt(string_copy(str,1,1))
var xx = base32StringToInt(string_copy(str,2,2))
var yy = base32StringToInt(string_copy(str,4,2))
var obj
switch paletteid {
    case 1:  obj=oEditBlock break
    case 2:  obj=oEditMiniBlock break
    case 3:  obj=oSpikeUp break
    case 4:  obj=oSpikeRight break
    case 5:  obj=oSpikeLeft break
    case 6:  obj=oSpikeDown break
    case 7:  obj=oMiniSpikeUp break
    case 8:  obj=oMiniSpikeRight break
    case 9:  obj=oMiniSpikeLeft break
    case 10: obj=oMiniSpikeDown break
    case 11: obj=oApple break
    case 12: obj=oSave break
    case 13: obj=oPlatform break
    case 14: obj=oWater break
    case 15: obj=oWater2 break
    case 16: obj=oWalljumpL break
    case 17: obj=oWalljumpR break
    case 18: obj=oKillerBlock break
    case 19: obj=oBulletBlocker break
    case 20: obj=oPlayerStart break
    case 21: obj=oWarp break
    case 22: obj=oJumpRefresher break
    case 23: obj=oWater3 break
    default: return noone
}

var inst = instance_create(xx-128,yy-128,obj);
inst.undo_recent = false
return inst
