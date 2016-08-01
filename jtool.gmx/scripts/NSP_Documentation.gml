/* N STRING PARSER - DOCUMENTATION:
   v2.4.9
   
By Surgeon_. You can send me a PM on GMC if you have any questions, bug reports and/or suggestions.
Credit would be nice if you use it.

>>LICENSE:
  -Copyright 2015 Jovan Batnožiæ

  -N String Parser v2.4.9 is free software: you can redistribute it and/or modify it under the terms of the
   GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of
   the License, or (at your option) any later version.

   N String Parser is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
   even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser
   General Public License for more details.

   You should have received a copy of the GNU Lesser General Public License along with this script set.
   If not, see <http://www.gnu.org/licenses/>.

  -Basically, what this means is that if you make a program/game with NSP you can freely distribute it or
   sell it, without exposing the program's/game's source code. However, if you decide to modify NSP, you'll
   have to release its modified version under GNU Lesser General Public License as well.
   
 ---------------------------------------------------------------------------------------------------------------  

>>BASIC GUIDELINES:
  -Initializing: To initialize the parser, call script NSP_initialize. You can change that script to use
                 whatever tokens/operators suit you, but follow the instructions given there to avoid errors.
  
  -Freeing: To free the memory used by the parser, call script NSP_free. Regarding its argument, read section
            "Saving".
  
  -Executing: To execute a string, call NSP_execute_string.
  
  -Evaluating: To evaluate a string (an expression or an equation in the form of a string, such as 5+6
               or (my_number(x+y) / (20 mod 14)), or whatever, call script NSP_evaluate. Note that when
               using variables like x, y, or any other, NSP will access those of the calling instance.
  
  -Notifying: In the case of a syntax error, NSP will not crash your game, it will only abort execution
              (or evaluation) and call NSP_notify to let you know what went wrong (well, that's at least
              what should happen). You can change that script to inform the user about an error in another
              way, or not inform them at all. Because there are usually multiple NSP_notify calls when an
              error occurs, you should use some method which does not stop the Runner. When using NSP_evaluate,
              in the case of an error, that function will return the abort string (also defined in script
              NSP_initialize, by default it's NSP__ABORT). Note that trying to access uninitialized variables
              will crash your game anyway, and there's no way to prevent that. However, it would be nice to
              report any other situation where NSP crashed your program to see if it can be fixed
              (Surgeon_ on GMC).
              
  -Saving: When you want to execute or evaluate the same string multiple times, it is faster to pre-parse
           the string (using NSP_save(...) function) and then use NSP_execute_saved(...) and
           NSP_evaluate_saved(...).
           Example:
                      
           a=NSP_save("x=player_get_x();");
           NSP_execute_saved(a);
           
           IMPORTANT: When you use NSP_save(...) function you get the information in the form of a ds_list and
           you should treat it as a ds_list - destroy it when you no longer need it! (For example:
           NSP_free_saved(a); ) Note that calling NSP_free() will only destroy these lists if you provide "true"
           as its argument.
  
  -Underlying scripts: Scripts that have names starting with "nsp_" rather than "NSP_" are underlying and
                       should not be changed (except for nsp_variable_* scripts and nsp_execute_script),
                       and also should not be used individually (except for nsp_string_* functions, which you
                       can use to format strings, if you understand what they do).
                       
  -Semicolons: Make sure to end each part of your code with semicolons ( ; )! This is very important! For
               example, executing "x+=8; y+=8;" will work, but executing "x+=8 y+=8;" will not! In some
               instances semicolons may not be needed (for example at the very end of the string to execute),
               but better to be safe than sorry.
               
  -Blocks of code: You can use { and } to make blocks of code to be executed as a single thing after a, for
                   example, if statement. You should also put a semicolon after closing a block.
                   (  { -code- };  ) You can also use begin / end instead of { / } if you so desire.
                   
  -Executing scripts: NSP can execute all custom scripts (using asset_get_index), and built-in ones that
                      you define, however, it cannot execute scripts with more than 15 arguments. Also, if a
                      script returns a value which is not a string or a real, NSP can't interpret it.
                      
  -Using asset names: You can use asset names in scripts (for example, instance_create(x,y,obj_player) will
                      work if obj_player exists).
                      
 ---------------------------------------------------------------------------------------------------------------

>>SUPPORTED BUILT-IN SCRIPTS:
  - show_message(),
  - instance_create(),
  - instance_destroy(),
  - game_restart(),
  - room_goto_next().
  
  *How to add more: Because asset_get_index does not work on built-in scripts, these have to be added
                    manually. Find the nsp_execute_script(...) script (in the Main parser section).
                    Follow the already established pattern to add more scripts to use (though you can
                    also remove them to prevent them from being used).

>>SUPPORTED VARIABLES:
  - id, x, y, speed, direction, hspeed, vspeed, image_angle, image_index, image_speed,
    sprite_index, object_index, _hspeed, _vspeed, _health, a, b, c, d, i, t, z, counter.
    
  *How to add more: Because GM:S has no way of accessing variables dynamically, this part has to be
                    done manually. You need to find two scripts, nsp_variable_set and nsp_variable_get
                    (in the Variable parser section). In both of them, find the large "switch" construction
                    and follow the already established format to add more variables to use (though you
                    can also remove them to prevent them from being used).
  
>>SUPPORTED GLOBAL VARIABLES:
  - score, health, lives, state, mouse_x, mouse_y.
  
  -NOTE: NSP reckognizes a global variable because of its ".global" prefix. Because of that, to read
         or write built-in global scope variables such as "score", you need to write "global.score",
         although ultimately the effect will be the same.
  
  *How to add more: Same situation as with local variables. This time you need to find nsp_variable_global_set
                    and nsp_variable_global_get (in the Variable parser section) and follow the already
                    established patern to add more global variables to use (though you can also remove them
                    to prevent them from being used).
                    
>>SUPPORTED CONSTANTS:
  - mb_left, mb_right, mb_middle, vk_left, vk_right, vk_up, vk_down, vk_enter.
  
  *How to add more: Because GM:S has no way of accessing constants dynamically, this part has to be
                    done manually. You need to find a script named nsp_get_constant in the Utility section.
                    Open it and find the large "switch" construction and follow the already established
                    format to add more constants to use (though you can also remove them to prevent them
                    from being used). These do not neccesarily have to be built-in constants, you can also
                    use user-defined ones.
  
>>SUPPORTED SPECIAL WORDS:
  - self,
  - other.
  
>>SUPPORTED STATEMENTS:
  - With,
  - Repeat,
  - If,
  - While.
  
  -NOTE: All of these muse be in the following format:
         [Statement] ([Counter/Condition]) [Code to execute]; <-- Semicolon is VERY important here!
         
>>DSM FUNCTIONALITY:
  -NSP has a quick access functionality for a single global ds_map (use nspDsMsp to reference it if you
   need to). In the nsp_initialize script you'll need to enable DSM and set a reference word for it (by
   default it's "NSP_DSM"). Later, when executing code using NSP you can write NSP_DSM.a=5,
   (or instead NSP_DSM whatever name you defined), and it will assign 5 to the key "a" in that ds_map.
   Later, when you need to retreive that value, just use NSP_DSM.a again. You can also use NSP_DSM+=a,
   NSP_DSM*=a etc. DSM is useful because ds_map keys can be strings and so can be accessed dynamically
   (in other words, when using DSM you can use any variable name, not just those defined in nsp_variable_*
   functions).
 
 --------------------------------------------------------------------------------------------------------------- 
  
>>EXAMPLES:
  (These are a few examples of what NSP can execute or appraise.)
  
  - x=my_number(x+y) / ( (20 mod 14) * ('a'=='a') / (3 +- (6+4==7)) ) +16;
  - instance_create(x,y,obj_tester).vspeed=2;
  - with (other) {instance_destroy()};
  - with (instance_create(32,32,obj_tester)) hspeed=1;
  - "my_number(1+my_number( ... +my_number(1))))))))))))))))))))))))))))))";
*/
