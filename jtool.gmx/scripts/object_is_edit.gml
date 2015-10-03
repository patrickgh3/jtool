var objectindex = argument0

switch objectindex {
    case oSpikeUp: case oSpikeRight: case oSpikeLeft: case oSpikeDown:
    case oMiniSpikeUp: case oMiniSpikeRight: case oMiniSpikeLeft: case oMiniSpikeDown:
    case oEditBlock: case oEditMiniBlock:
    case oApple: case oSave: case oPlatform: case oKillerBlock:
    case oWater: case oWater2:
    case oWalljumpL: case oWalljumpR:
    case oBulletBlocker:
    case oPlayerStart:
    case oWarp:
        return true
    default:
        return false
}
