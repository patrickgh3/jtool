///nsp_is_dsm(String)
/*
Underlying NSP script.
*/
var nspToken=global.nspToken;
var work_str;

work_str=argument0;

/*if string_copy(work_str,1,string_length(nspToken[NSP_TOK.dsm_name])+1)=
   nspToken[NSP_TOK.dsm_name]+"."
 return true;*/
 
if work_str=nspToken[NSP_TOK.dsm_name]
 return true;
 
return false;

