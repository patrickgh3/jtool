// todo: description
// returns '' if not saveable

var obj = argument0

var pal_id
switch obj.object_index {
    case oEditBlock: pal_id=1 break
    case oEditMiniBlock: pal_id=2 break
    case oSpikeUp: pal_id=3 break
    case oSpikeRight: pal_id=4 break
    case oSpikeLeft: pal_id=5 break
    case oSpikeDown: pal_id=6 break
    case oMiniSpikeUp: pal_id=7 break
    case oMiniSpikeRight: pal_id=8 break
    case oMiniSpikeLeft: pal_id=9 break
    case oMiniSpikeDown: pal_id=10 break
    case oApple: pal_id=11 break
    case oSave: pal_id=12 break
    case oPlatform: pal_id=13 break
    case oWater: pal_id=14 break
    case oWater2: pal_id=15 break
    case oWalljumpL: pal_id=16 break
    case oWalljumpR: pal_id=17 break
    case oKillerBlock: pal_id=18 break
    case oBulletBlocker: pal_id=19 break
    case oPlayerStart: pal_id=20 break
    case oWarp: pal_id=21 break
    case oJumpRefresher: pal_id=22 break
    case oWater3: pal_id=23 break
    default: return ''
}

return intToBase64String(pal_id)
     + padStringLeft(intToBase64String(obj.x+128),2,'0')
     + padStringLeft(intToBase64String(obj.y+128),2,'0')
