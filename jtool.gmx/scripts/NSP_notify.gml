///NSP_notify(Message, [OPT] List, Start, End)
/*
Notifies the user about an error that has occured. You can change this script
(read NSP Documentation for more info).
*/
var;

if (argument_count>1) {
 
 argument[0]+=" FAULTY CODE: "+nsp_list_to_string(argument[1],argument[2],argument[3],"^");
  
 }

//EDIT BY KLAZEN: set a global flag to indicate an error has occurred
//show_error(argument[0],false);
show_message(argument[0]);
global._nsp_error=true;
