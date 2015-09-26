var obj = argument0

var sid
switch obj.object_index {
    case oEditBlock: sid=1 break
    case oEditMiniBlock: sid=2 break
    case oSpikeUp: sid=3 break
    case oSpikeRight: sid=4 break
    case oSpikeLeft: sid=5 break
    case oSpikeDown: sid=6 break
    case oMiniSpikeUp: sid=7 break
    case oMiniSpikeRight: sid=8 break
    case oMiniSpikeLeft: sid=9 break
    case oMiniSpikeDown: sid=10 break
    case oApple: sid=11 break
    case oSave: sid=12 break
    case oPlatform: sid=13 break
    case oWater: sid=14 break
    case oWater2: sid=15 break
    case oWalljumpL: sid=16 break
    case oWalljumpR: sid=17 break
    case oKillerBlock: sid=18 break
    default: show_message('tried to serialize a non-edit object! should have check object_is_edit first.') exit
}

return real_to_base32string(sid,1)   // 1 chars since sid < 32
     + real_to_base32string(obj.x,2) // 2 chars since x will be < 1024
     + real_to_base32string(obj.y,2) // 2 chars since y will be < 1024
