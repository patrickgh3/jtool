///nsp_is_string(String)
/*
Underlying NSP script.
*/
var nspToken=global.nspToken;
var q;

q=nspToken[NSP_TOK.quote];

if string_copy(argument0,1,1)==q and string_copy(argument0,string_length(argument0),1)==q
&& string_pos(q,nsp_string_crop_ext(argument0,q))=0
 return true
  else return false;

