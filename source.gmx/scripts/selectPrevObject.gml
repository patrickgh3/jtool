switch( selected_object ) {
    // Spikes.
    case oSpikeLeft:
        selected_object = oSpikeDown;
        selected_sprite = sSpikeDown;
        break;
    case oSpikeDown:
        selected_object = oSpikeRight;
        selected_sprite = sSpikeRight;
        break;
    case oSpikeRight:
        selected_object = oSpikeUp;
        selected_sprite = sSpikeUp;
        break;
    case oSpikeUp:
        selected_object = oSpikeLeft;
        selected_sprite = sSpikeLeft;
        break;
    
    // Minispikes.
    case oMiniSpikeLeft:
        selected_object = oMiniSpikeDown;
        selected_sprite = sMiniSpikeDown;
        break;
    case oMiniSpikeDown:
        selected_object = oMiniSpikeRight;
        selected_sprite = sMiniSpikeRight;
        break;
    case oMiniSpikeRight:
        selected_object = oMiniSpikeUp;
        selected_sprite = sMiniSpikeUp;
        break;
    case oMiniSpikeUp:
        selected_object = oMiniSpikeLeft;
        selected_sprite = sMiniSpikeLeft;
        break;
        
    // Blocks.
    case oEditBlock:
        selected_object = oEditMiniBlock;
        selected_sprite = sEditMiniBlock;
        break;
    case oEditMiniBlock:
        selected_object = oEditBlock;
        selected_sprite = sEditBlock;
        break;
    // Water:
    case oWater:
        selected_object = oWater3;
        selected_sprite = sWater3;
        break;        
    case oWater2:
        selected_object = oWater;
        selected_sprite = sWater1;
        break;
    case oWater3:
        selected_object = oWater2;
        selected_sprite = sWater2;
        break;
    
    // Vines:
    case oWalljumpL:
        selected_object = oWalljumpR;
        selected_sprite = sWalljumpR;
        break;
    case oWalljumpR:
        selected_object = oWalljumpL;
        selected_sprite = sWalljumpL;
        break;
        
    // Saves.
    case oSave:
        selected_object = oBulletBlocker;
        selected_sprite = sBulletBlocker;
        break;
    case oBulletBlocker:
        selected_object = oSave;
        selected_sprite = sSave;
        break;
        
    // Killers.
    case oApple:
        selected_object = oKillerBlock;
        selected_sprite = sKillerBlock;
        break;
    case oKillerBlock:
        selected_object = oMiniKillerBlock;
        selected_sprite = sMiniKillerBlock;
        break;
    case oMiniKillerBlock:
        selected_object = oApple;
        selected_sprite = sApple;
        break;
    
    // Gravity:
    case oGravityArrowUp:
        selected_object = oGravityArrowDown;
        selected_sprite = sGravityArrowDown;
        break;
    case oGravityArrowDown:
        selected_object = oGravityArrowUp;
        selected_sprite = sGravityArrowUp;
        break;
        
    // Level start/end:
    case oPlayerStart:
        selected_object = oWarp;
        selected_sprite = sWarp;
        break;
    case oWarp:
        selected_object = oPlayerStart;
        selected_sprite = sPlayerStart;
        break;
    
    default:
        break;
}
