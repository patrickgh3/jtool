var obj = argument0

switch obj {
    case oEditBlock: return 2
    case oSpikeUp: return 12
    case oSpikeRight: return 11
    case oSpikeLeft: return 10
    case oSpikeDown: return 9
    case oMiniSpikeUp: return 19
    case oMiniSpikeRight: return 18
    case oMiniSpikeLeft: return 17
    case oMiniSpikeDown: return 16
    case oSave: return 32
    case oPlatform: return 31
    case oWater1: return 23
    case oWater2: return 30
    case oApple: return 20
    case oKillerBlock: return 27
    case oWalljumpR: return 28
    case oWalljumpL: return 29
    case oPlayerStart: return 3
}
return -1
