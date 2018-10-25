//Says what frame(s) extra shift releases happened on


if oPlayer.vspeed < 0 and keyboard_check_released(global.key_jump) and global.TIMER_ON = false
{ //initialise
    
    global.lowcancel1 = ''
    global.lowcancel2 = ''
    global.lowcancel3 = ''
    global.TIMER_ON = true;
    global.start_time = 0; 
}

if(global.TIMER_ON)
{//check your conditions
global.start_time = global.start_time + 1;
    if(oPlayer.vspeed < 0 and keyboard_check_released(global.key_jump))
    {
        global.lowcancel1 = global.start_time; //log the time this happened
        
        
    }

    if(oPlayer.vspeed < 0 and keyboard_check_released(global.key_jump) and global.lowcancel1 != '')
    {
       global.lowcancel2 = global.start_time; //log the time this happened
       
    }
    if(oPlayer.vspeed < 0 and keyboard_check_released(global.key_jump) and global.lowcancel2 != '')
    {
        global.lowcancel3 = global.start_time; //log the time this happened
        
    }

    if(oPlayer.vspeed >= 0)
    {
        global.TIMER_ON = false;
        /*global.lowcancel1 -= global.start_time ; //subtract start time to get relative time
        global.lowcancel2 -= global.start_time ;
        global.lowcancel3 -= global.start_time ;*/
    }
}
