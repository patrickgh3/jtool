// Returns whether or not an object is a special palette object.
// Mainly used in oEdit to differentiate objects placed by the user
// from other misc objects.

var objectindex = argument0

switch objectindex {
    case oSpikeUp:
    case oSpikeRight:
    case oSpikeLeft:
    case oSpikeDown:
    case oMiniSpikeUp:
    case oMiniSpikeRight:
    case oMiniSpikeLeft:
    case oMiniSpikeDown:
    case oEditBlock:
    case oEditMiniBlock:
    case oApple:
    case oSave:
    case oPlatform:
    case oKillerBlock:
    case oWater:
    case oWater2:
    case oWater3:
    case oWalljumpL:
    case oWalljumpR:
    case oBulletBlocker:
    case oPlayerStart:
    case oWarp:
    case oJumpRefresher:
    return true
}
return false
