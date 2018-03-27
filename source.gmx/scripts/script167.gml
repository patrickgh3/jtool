if keyboard_check_pressed(vk_f8)
   {
   global.Saved = true;
   game_save("Save.dat");
   }
if keyboard_check_pressed(vk_f9)
   {
   if global.Save game_load("Save.dat");
   }
