if not oEdit.undo_nochanges {
    if (show_question('The map has unsaved changes.#Are you sure you want to exit?')) {
        game_end()
    }
}
else {
if (file_exists("Screenie.png"))
{
   Background = sprite_add("Screenie.png",0,false,true,0,0)
}
if file_exists("Save5.dat")
   {
   file_delete("Save5.dat");
   }
if file_exists("Save6.dat")
   {
   file_delete("Save6.dat");
   }
if file_exists("Save7.dat")
   {
   file_delete("Save7.dat");
   }
if file_exists("Save8.dat")
   {
   file_delete("Save8.dat");
   }
if file_exists("Save9.dat")
   {
   file_delete("Save9.dat");
   }
if file_exists("Save10.dat")
   {
   file_delete("Save10.dat");
   }
if file_exists("Save11.dat")
   {
   file_delete("Save11.dat");
   }
if file_exists("Save12.dat")
   {
   file_delete("Save12.dat");
   }
    game_end()
}
