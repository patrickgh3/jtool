var objectindex = argument0

switch objectindex {
    case oEditBlock:        return 1
    case oEditMiniBlock:    return 2
    case oSpikeUp:          return 3
    case oSpikeRight:       return 4
    case oSpikeLeft:        return 5
    case oSpikeDown:        return 6
    case oMiniSpikeUp:      return 7
    case oMiniSpikeRight:   return 8
    case oMiniSpikeLeft:    return 9
    case oMiniSpikeDown:    return 10
    case oApple:            return 11
    case oSave:             return 12
    case oPlatform:         return 13
    case oWater:            return 14
    case oWater2:           return 15
    case oWalljumpL:        return 16
    case oWalljumpR:        return 17
    case oKillerBlock:      return 18
    case oBulletBlocker:    return 19
    case oPlayerStart:      return 20
    case oWarp:             return 21
    case oJumpRefresher:    return 22
    case oWater3:           return 23
    case oGravityArrowUp:   return 24
    case oGravityArrowDown: return 25
    case oSaveFlip:         return 26
    case oMiniKillerBlock:  return 27
    default: return -1
}
